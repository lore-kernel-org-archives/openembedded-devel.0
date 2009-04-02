Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LpGYX-0007pG-C9
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 08:37:45 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LpGWB-0005Dr-VJ
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 06:35:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 06:35:15 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 06:35:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 02 Apr 2009 08:35:05 +0200
Message-ID: <gr1map$913$1@ger.gmane.org>
References: <87tz583wok.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <87tz583wok.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFH] Ugly dependency on a locale package
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
X-List-Received-Date: Thu, 02 Apr 2009 06:37:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-04-09 23:12, Otavio Salvador wrote:
> Hello,
>
> Today we spot a wierd package in our image and then we ended figuring
> out that something quite strange is happening.

Does it use do_split_package without specifying base_depends?

regards,

Koen

>
>   new debian package, version 2.0.
>   size 9880 bytes: control archive= 471 bytes.
>       497 bytes,    13 lines      control
>   Package: evince-locale-pt-br
>   Version: 2.24.1-r2.1
>   Description: pt_BR translation for evince
>   Section: x11/office
>   Priority: optional
>   Maintainer: Angstrom Developers<angstrom-distro-devel@linuxtogo.org>
>   License: GPL
>   Architecture: geode
>   OE: evince
>   Homepage: http://www.ossystems.com.br
>   Depends: evince-nautilus-extension, virtual-locale-pt-br
>   Provides: evince-locale, pt-br-translation
>   Source: http://ftp.gnome.org/pub/GNOME/sources/evince/2.24/evince-2.24.1.tar.bz2 file://no-help-dir.patch;patch=1
>
>
> Look the line:
>
>    Depends: evince-nautilus-extension, virtual-locale-pt-br
>             ^^^^^^^^^^^^^^^^^^^^^^^^^
>
> WHY?
>
>




