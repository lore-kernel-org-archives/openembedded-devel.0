Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q7svX-00089M-Vo
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 19:23:28 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1Q7stV-0003wh-Ip; Thu, 07 Apr 2011 19:21:21 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
Date: Thu, 07 Apr 2011 18:21:18 +0100
Message-ID: <1302196878.14449.442.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 1/6] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Thu, 07 Apr 2011 17:23:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-07 at 13:19 +0000, Otavio Salvador wrote:
> -PACKAGES =+ "libudev libgudev udev-utils"
> +PACKAGES =+ "libudev libgudev udev-utils udev-consolekit"
>  
>  FILES_libudev = "${base_libdir}/libudev.so.*"
>  FILES_libgudev = "${base_libdir}/libgudev*.so.*"
> @@ -84,7 +84,8 @@ FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
>  
>  # udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
>  # is ${prefix}/lib64
> -FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
> +FILES_${PN} += "/lib/udev*"
> +FILES_${PN}-consokekit += "${libdir}/ConsoleKit"

Did you test this patch?  Surely the line above should read
"${PN}-consolekit" otherwise it won't match anything.

p.




