Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QosEB-00059i-Ah
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 09:20:23 +0200
Received: by fxg11 with SMTP id 11so519227fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 00:16:00 -0700 (PDT)
Received: by 10.204.138.156 with SMTP id a28mr139328bku.13.1312442160203;
	Thu, 04 Aug 2011 00:16:00 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id h7sm441116bkd.45.2011.08.04.00.15.58
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 00:15:59 -0700 (PDT)
Message-ID: <4E3A472D.3030001@dresearch-fe.de>
Date: Thu, 04 Aug 2011 09:15:57 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1312192798-18259-1-git-send-email-koen@openembedded.org>
	<4E36AAB5.4080307@dresearch-fe.de>
In-Reply-To: <4E36AAB5.4080307@dresearch-fe.de>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 07:20:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.08.2011 15:31, Steffen Sledz wrote:
> On 01.08.2011 11:59, Koen Kooi wrote:
>> Also import a fix from OE-core for setting the loader dir.
>>
>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>
>> Signed-off-by: Koen Kooi <koen@openembedded.org>
> 
> Acked-by: Steffen Sledz <sledz@dresearch-fe.de>

Ping!

> Thx for this. Would be nice, if this patch could find it's way to 2011.03-maintenance branch too.
> 
>> ---
>>  classes/gtk-icon-cache.bbclass |   11 +++++++----
>>  1 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/classes/gtk-icon-cache.bbclass b/classes/gtk-icon-cache.bbclass
>> index 2449e95..d9b5d1b 100644
>> --- a/classes/gtk-icon-cache.bbclass
>> +++ b/classes/gtk-icon-cache.bbclass
>> @@ -1,6 +1,4 @@
>>  FILES_${PN} += "${datadir}/icons/hicolor"
>> -# Only add runtime dependency on hicolor-icon-theme for target recipes
>> -RDEPENDS_${PN} += "${@['', 'hicolor-icon-theme']['${PN}' == '${BPN}']}"
>>  
>>  # This could run on the host as icon cache files are architecture independent,
>>  # but there is no gtk-update-icon-cache built natively.
>> @@ -10,7 +8,7 @@ if [ "x$D" != "x" ]; then
>>  fi
>>  
>>  # Update the pixbuf loaders in case they haven't been registered yet
>> -gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
>> +GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
>>  
>>  for icondir in /usr/share/icons/* ; do
>>      if [ -d $icondir ] ; then
>> @@ -35,7 +33,12 @@ python populate_packages_append () {
>>  		icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, bb.data.getVar('datadir', d, 1))
>>  		if not os.path.exists(icon_dir):
>>  			continue
>> -		
>> +
>> +		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
>> +		rdepends = bb.data.getVar('RDEPENDS', d, 1)
>> +		rdepends += "hicolor-icon-theme"
>> +		bb.data.setVar('RDEPENDS', rdepends, d)
>> +	
>>  		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
>>  		
>>  		postinst = bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or bb.data.getVar('pkg_postinst', d, 1)
> 
> 


-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


