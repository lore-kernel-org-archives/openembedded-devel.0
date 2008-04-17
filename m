Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JmaHs-0007sK-Jh
	for openembedded-devel@openembedded.org; Thu, 17 Apr 2008 22:00:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JmaHq-0001Tx-1q
	for openembedded-devel@openembedded.org; Thu, 17 Apr 2008 20:00:50 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 17 Apr 2008 20:00:50 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 17 Apr 2008 20:00:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 17 Apr 2008 22:00:43 +0200
Message-ID: <fu8a9b$ces$1@ger.gmane.org>
References: <20080417175150.GJ31895@buddha.tw.openmoko.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008040803)
In-Reply-To: <20080417175150.GJ31895@buddha.tw.openmoko.com>
Sender: news <news@ger.gmane.org>
Subject: Re: RDEPENDS_${PN}-dev = ${PN} badness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Apr 2008 20:00:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

John Lee wrote:
> Hi,
>
> Take gtk-doc-dev for example:
>
> The gtk-doc package is empty, so it will not be created.  However, if
> you install gtk-doc-dev, it RDEPENDS on gtk-doc, which cannot be
> found.  The install will fail.
>
> I think we should use
>
> RRECOMMENDS_${PN}-dev = "${PN} (= ${DEBPV})"
>
> instead.

ALLOW_EMPTY_${PN} = "1" would be a better idea, and in line without 
other depchain workarounds.

regards,

Koen

>
> We (Julian Chu and me) found this when digging the cause of
> meta-toolchain-openmoko build failure.  task-openmoko-toolchain-target
> contains quite a few -dev packages in it, so the opkg-cl install will
> fail.  The log looks something like this:
>
> ERROR: Cannot satisfy the following dependencies for
>           task-openmoko-toolchain-target: gtk-doc (= 1.0-r1)
>           util-macros (= 1:1.1.5-r1) renderproto (= 1:0.9.3-r0) xproto
>           (= 1:7.0.10-r1) bigreqsproto (= 1:1.0.2-r1) xextproto (=
>           1:7.0.2-r1) xtrans (= 1:1.0.4-r0) xcmiscproto (= 1:1.1.2-r1)
>           xf86bigfontproto (= 1:1.1.2-r1) kbproto (= 1:1.0.3-r1)
>           inputproto (= 1:1.4.2.1-r0) fixesproto (= 1:4.0-r1)
>           xineramaproto (= 1:1.1.2-r1) randrproto (= 1:1.2.1-r1)
>           compositeproto (= 1:0.4-r0) damageproto (= 1:1.1.0-r1)
>
> Similiar symptoms can be found in the packages above.
>
> Regards,
> John




