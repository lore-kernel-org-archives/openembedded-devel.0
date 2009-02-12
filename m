Received: from [66.80.197.243] (helo=looper.buglabs.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@buglabs.net>) id 1LXgSR-0005KG-2j
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 19:38:43 +0100
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by looper.buglabs.net (Postfix) with ESMTP id E61D9340C5;
	Thu, 12 Feb 2009 13:39:57 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by aphid.buglabs.net (Postfix) with ESMTP id DB68728E002;
	Thu, 12 Feb 2009 13:39:00 -0500 (EST)
X-Virus-Scanned: amavisd-new at aphid.buglabs.net
Received: from aphid.buglabs.net ([127.0.0.1])
	by localhost (aphid.buglabs.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1WJBtt-AZ5I; Thu, 12 Feb 2009 13:39:00 -0500 (EST)
Received: from [192.168.0.120] (t61.buglabs.net [192.168.0.120])
	by aphid.buglabs.net (Postfix) with ESMTP id 3726F28E001;
	Thu, 12 Feb 2009 13:39:00 -0500 (EST)
From: Ken Gilmer <ken@buglabs.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gn1m9a$5tl$5@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
	<gn1m9a$5tl$5@ger.gmane.org>
Organization: Bug Labs, Inc.
Date: Thu, 12 Feb 2009 13:39:44 -0500
Message-Id: <1234463984.3413.263.camel@t61.buglabs.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 5/6] sun-jre6: add 1.6.0.10
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
X-List-Received-Date: Thu, 12 Feb 2009 18:38:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Also, I may be missing something here but isn't this binary-only package
for i586 architecture?  Not seeing in the recipe where the architecture
is constrained.

thx
ken

On Thu, 2009-02-12 at 18:29 +0100, Koen Kooi wrote:
> On 12-02-09 17:38, Otavio Salvador wrote:
> > Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> > ---
> 
> NACK:
> 
> > +PACKAGES =+ "${PN}-plugin"
> > +
> > +FILES_${PN} = "/usr/"
> > +FILES_${PN}-dbg += "/usr/*/.debug /usr/*/*/.debug /usr/*/*/*/.debug /usr/*/*/*/*/.debug /usr/*/*/*/*/*/.debug"
> > +FILES_${PN}-plugin = "${libdir}/firefox-3.0.1/plugins/* ${libdir}/sun-java6-${PV}/plugin/i386/ns7/libjavaplugin_oji.so"
> 
> it would be better to install the plugin to /usr/lib/mozilla/plugins and 
> have a postinst that symlinks it to ${libdir}/firefox-*, 
> ${libdir}/fennec-*, ${libdir}/iceweasle when those are present. That way 
> other browser implement NPAPI (webkit...) can use the one in 
> mozilla/plugins.
> 
> regards,
> 
> Koen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



