Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C80EA76DE1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 06:14:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U6EeXu002204
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 23:14:40 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 29 Sep 2015 23:14:39 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1443510290-26782-1-git-send-email-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <560B7DDA.8090803@windriver.com>
Date: Wed, 30 Sep 2015 14:14:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443510290-26782-1-git-send-email-kai.kang@windriver.com>
Subject: Re: [meta-oe][PATCH 0/2] V2: Upgrade efivar and efibootmgr
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
X-List-Received-Date: Wed, 30 Sep 2015 06:14:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年09月29日 15:04, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Hi Martin,
>
> V2 only affects efivar commit:
> * update git repo - the previous repo uri is a clone of the official repo
> * add efivar-native package to provide command makeguids for efivar to avoid cross compile issue

Forgot add option '-M' for 'git format-patch', will resend it.

--Kai

>
> Kai Kang (2):
>    efivar: 0.7 -> 0.21
>    efibootmgr: 0.6.0 -> 0.12
>
>   .../recipes-extended/efibootmgr/efibootmgr_0.12.bb | 27 +++++++++++++++++++
>   .../efibootmgr/efibootmgr_0.6.0.bb                 | 26 ------------------
>   .../efibootmgr/files/docbook-fixes.patch           | 28 -------------------
>   .../files/w-keep-existing-mbr-signature.patch      | 26 ------------------
>   .../efivar/0001-efivar-fix-for-cross-compile.patch | 31 ++++++++++++++++++++++
>   meta-oe/recipes-extended/efivar/efivar_0.21.bb     | 28 +++++++++++++++++++
>   meta-oe/recipes-extended/efivar/efivar_git.bb      | 18 -------------
>   7 files changed, 86 insertions(+), 98 deletions(-)
>   create mode 100644 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
>   delete mode 100644 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
>   delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
>   delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch
>   create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>   create mode 100644 meta-oe/recipes-extended/efivar/efivar_0.21.bb
>   delete mode 100644 meta-oe/recipes-extended/efivar/efivar_git.bb
>


-- 
Regards,
Neil | Kai Kang


