Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N1JiB-0002tA-Ue for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 14:57:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N1JhC-0002sf-4y
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 14:56:42 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 14:56:42 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 14:56:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Oct 2009 14:56:18 +0200
Message-ID: <hbs95i$p6r$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>	<1256286976.4529.117.camel@mill.internal.reciva.com>	<hbrs68$gbd$1@ger.gmane.org>
	<200910231133.11053.holger+oe@freyther.de>	<hbs7hq$j3v$1@ger.gmane.org>
	<1256301732.4529.161.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1256301732.4529.161.camel@mill.internal.reciva.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 12:57:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

How about this one: 
http://dominion.thruhere.net/git/cgit.cgi/openembedded/commit/?h=koen/static-libs-rework&id=bfa6dd452da52a4516a712f288030c3571ed6c4c 
?

regards,

Koen

On 23-10-09 14:42, Phil Blundell wrote:
> On Fri, 2009-10-23 at 14:28 +0200, Koen Kooi wrote:
>> -libc_baselibs = "${base_libdir}/libcrypt*.so.*
>> ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.*
>> ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.*
>> ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so
>> ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so
>> ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so
>> ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so
>> ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so
>> ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so
>> ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so
>> ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so
>> ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so
>> ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so
>> ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so
>> ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
>> +libc_baselibs = "${base_libdir}/libcrypt*.so.*
>> ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.*
>> ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.*
>> ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so
>> ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so
>> ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so
>> ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so
>> ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so
>> ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so
>> ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so
>> ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so
>> ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so
>> ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so
>> ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so
>> ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so
>> ${base_libdir}/libcidn-*.so  ${base_libdir}/libmemusage.so"
>
> It took me a moment to spot what was actually happening here, but I
> think this is a step in the wrong direction.  Libmemusage is not
> something that most folks are going to want in their rootfs; libcidn is
> a bit more debatable but I suspect that at least some people will view
> it as bloat.  I would prefer to see the glibc packaging becoming less
> rather than more monolithic and I think these two libraries would be
> better placed in their own subpackages.
>
> (Also, as an aside, this part of the patch doesn't seem to have anything
> to do with the static libs and it should probably not be bundled into
> the same changeset.)
>
> p.




