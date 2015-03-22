Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 849406AC33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2015 17:23:45 +0000 (UTC)
Received: by wibg7 with SMTP id g7so21709167wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2015 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=mgTm/Dfm/1quu+9ly1+wtZtK0FBjkNw8rj/iW3H7XO0=;
	b=hgPaJADQ5dOT0Y2DA5Huzm22POORwKOOe76VkzsSZi/56XA5m/Yl8MW/gznu/gRHTo
	iFE+BduabAnXQxH0sYRtjdu3lTmDqnZ+uI58IaVUvM7ajfwtBKbXe06yRE5VyXuD26nH
	BLdWavQ1l4WF9jK17WiaPpXTCdR690vhXtHsTvJXMAiQVlvH3BWJD2UFjSwAtdkUUOF7
	md2lVgAwgUt3AynZ+trBzdgBKtWuLff+PHpNdtG3tYmBCbJPVZA5sW26EB4+ufwehztZ
	2YXp4trQAt1S7tvkz/D+ZZx79TBHXK9FYSX9QNGOWbWSrcJuAbe92IE9b0eVfI7ZR0MN
	Oy1g==
X-Received: by 10.194.62.167 with SMTP id z7mr180199905wjr.106.1427045026918; 
	Sun, 22 Mar 2015 10:23:46 -0700 (PDT)
Received: from [192.168.0.15] (lns-bzn-49f-62-147-165-143.adsl.proxad.net.
	[62.147.165.143]) by mx.google.com with ESMTPSA id
	ha10sm15650418wjc.37.2015.03.22.10.23.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Mar 2015 10:23:46 -0700 (PDT)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
Message-ID: <550EFAA0.7080202@videolan.org>
Date: Sun, 22 Mar 2015 18:23:44 +0100
From: =?windows-1252?Q?Rafa=EBl_Carr=E9?= <funman@videolan.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1426861220-30221-1-git-send-email-funman@videolan.org>	<550E94BF.50908@videolan.org>
	<20150322155513.GN4738@jama>
In-Reply-To: <20150322155513.GN4738@jama>
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
X-List-Received-Date: Sun, 22 Mar 2015 17:23:46 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 03/22/2015 04:55 PM, Martin Jansa wrote:
> On Sun, Mar 22, 2015 at 11:09:03AM +0100, Rafaël Carré wrote:
>> Hello,
>>
>> I couldn't reproduce the checksum error with a fresh build with an empty
>> downloads/ folder.
>>
>> So this patch is apparently needed only when populating downloads/
>> folder before fetching vim.
>>
>> I will investigate a bit more, I think the patch should actually be in
>> bitbake
>> (missing supports_checksum for Hg.py)
> 
> Should bitbake support checksums for hg? We don't use them for any other
> SCM like git or svn, if we do that for hg, what will be included in th
> checksum? Whole directory with hg checkout? Is it stable (e.g. doesn't
> hg fetch everything and then checkout required revision like git does?)

Exactly, what I meant was Hg.py needs to explicitely say checksums are
disabled:

supports_checksum(foo):
    return False


> I've included this patch in master-next, but now when I see that it's
> fetched from hg I'll drop it.
> 
>> On 03/20/2015 03:20 PM, Rafaël Carré wrote:
>>> ---
>>>  meta-oe/recipes-support/vim/vim_7.4.481.bb | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
>>> index afdea84..ac59077 100644
>>> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
>>> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
>>> @@ -10,6 +10,10 @@ SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
>>>             file://disable_acl_header_check.patch;patchdir=.. \
>>>             file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
>>>  "
>>> +
>>> +SRC_URI[md5sum] = "5fd5d754581a673a25733c12367cf9d2"
>>> +SRC_URI[sha256sum] = "e2cc416dabea503e9e5631afc21bb00dcbfb9d05481641b75f247fd89ff4d7e8"
>>> +
>>>  SRCREV = "v7-4-481"
>>>  
>>>  S = "${WORKDIR}/vim/src"


