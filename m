Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B3B0E6AE37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 08:34:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA88YaYO004658
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 Nov 2013 00:34:36 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 8 Nov 2013 00:34:36 -0800
Message-ID: <527CA218.7050508@windriver.com>
Date: Fri, 8 Nov 2013 16:34:32 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1383884700.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1383884700.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/1] quagga: add pam support for vtysh
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Nov 2013 08:34:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2013 12:32 PM, Hongxu Jia wrote:
> Test Case:
> 1. Add DISTRO_FEATURES += 'pam' to local.conf and build image with
>     quagga.
>
> 2. On target:
> 1) cat /etc/pam.d/guagga

s/guagga/quagga/

//Hongxu

> #
> # The PAM configuration file for the quagga `vtysh' service
> #
>
> # This allows root to change user infomation without being
> # prompted for a password
> auth		sufficient	pam_rootok.so
>
> # The standard Unix authentication modules, used with
> # NIS (man nsswitch) as well as normal /etc/passwd and
> # /etc/shadow entries.
> auth       include      common-auth
>
> 2) add option debug to pam_rootok.so
>   auth	    sufficient	pam_rootok.so debug
>
> 3) pam_rootok.so
> run command vtysh as root, enter qemu0#:
> root@qemu0:~# vtysh
>
> Hello, this is Quagga (version 0.99.21).
> Copyright 1996-2005 Kunihiro Ishiguro, et al.
>
> qemu0#
> log info in /var/log/message(or /var/log/auth.log) shows pam_rootok.so return success:
> 2013-11-08T03:33:44.898360+00:00 qemu0 vtysh: pam_rootok(quagga:auth): root check succeeded
>
> 4) pam_unix.so
> the content of common-auth are shown at section "Common configure files"
> comment the configure file quagga pam_rootok.so line, because it will make pam return success:
>   #auth		sufficient	pam_rootok.so
> and modify the pam_unix.so line in common-auth to remove nullok_secure:
>   auth	[success=1 default=ignore]	pam_unix.so debug
>
> 5) run commands with invalid password:
> root@qemu0:~# vtysh
> Password:
> root@qemu0:~#
> log in /var/log/message(or /var/log/auth.log):
> 2013-11-08T04:20:49.418763+00:00 qemu0 vtysh: pam_unix(quagga:auth): authentication failure; logname=root uid=0 euid=0 tty= ruser= rhost=  user=root
>
> //Hongxu
>
>
> The following changes since commit ffb5434823195cbdc41c76a110eaa6ae04e2b010:
>
>    dnsmasq: uprev to 2.6.3 (2013-11-06 15:12:45 -0500)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/fix-quagga-pam
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-quagga-pam
>
> Hongxu Jia (1):
>    quagga: add pam support for vtysh
>
>   meta-networking/recipes-protocols/quagga/files/quagga.pam | 13 +++++++++++++
>   meta-networking/recipes-protocols/quagga/quagga.inc       | 13 ++++++++++++-
>   2 files changed, 25 insertions(+), 1 deletion(-)
>   create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.pam
>


