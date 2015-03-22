Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4266AC33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2015 10:09:05 +0000 (UTC)
Received: by wixw10 with SMTP id w10so31867441wix.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2015 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=f7uxQ4Q8Nc49b7QLDmq8+tfrMpC7C/kZlAwxV7NN6mA=;
	b=f25V4Yk6/yEFut51aow5hsPYKZEZG5tOfovw61iphWhBcNFXbldvA3AcXQ8HOB1Fa0
	ZneOgX7CQmnXTOGA8IXVHUEbd0ek+Ew+mcquuM2FbFS5fMEkDHCIg0vhPJEjNzOg5wgz
	bi4xTJmOCueKQ3Ea0OSx9qcWLkpmgJ5XlUbXALgJoK4f1cKuE7cpQ0tNKPpeT71iUfqF
	QdMNOwJMNOkolQ0fXxyuH9BZeY0neUIOI+o0Ad3AID9Uyn2VA69jPumZ3j8skOD493XF
	nBIZq3hA53wrewmFfqAWWVHicRizooxxj8VBSH70XjpqeVb4+R8aU4Be0pILvBniMdcD
	yFCA==
X-Received: by 10.194.2.145 with SMTP id 17mr104206626wju.79.1427018946410;
	Sun, 22 Mar 2015 03:09:06 -0700 (PDT)
Received: from [192.168.0.15] (lns-bzn-49f-62-147-165-143.adsl.proxad.net.
	[62.147.165.143])
	by mx.google.com with ESMTPSA id jy7sm5986962wid.22.2015.03.22.03.09.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Mar 2015 03:09:05 -0700 (PDT)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
Message-ID: <550E94BF.50908@videolan.org>
Date: Sun, 22 Mar 2015 11:09:03 +0100
From: =?windows-1252?Q?Rafa=EBl_Carr=E9?= <funman@videolan.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1426861220-30221-1-git-send-email-funman@videolan.org>
In-Reply-To: <1426861220-30221-1-git-send-email-funman@videolan.org>
Subject: Re: [meta-oe][PATCH] vim: add checksum
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
X-List-Received-Date: Sun, 22 Mar 2015 10:09:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hello,

I couldn't reproduce the checksum error with a fresh build with an empty
downloads/ folder.

So this patch is apparently needed only when populating downloads/
folder before fetching vim.

I will investigate a bit more, I think the patch should actually be in
bitbake
(missing supports_checksum for Hg.py)

On 03/20/2015 03:20 PM, Rafaël Carré wrote:
> ---
>  meta-oe/recipes-support/vim/vim_7.4.481.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> index afdea84..ac59077 100644
> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> @@ -10,6 +10,10 @@ SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
>             file://disable_acl_header_check.patch;patchdir=.. \
>             file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
>  "
> +
> +SRC_URI[md5sum] = "5fd5d754581a673a25733c12367cf9d2"
> +SRC_URI[sha256sum] = "e2cc416dabea503e9e5631afc21bb00dcbfb9d05481641b75f247fd89ff4d7e8"
> +
>  SRCREV = "v7-4-481"
>  
>  S = "${WORKDIR}/vim/src"
> 

