Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAC96FF5D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:55:17 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so219143891wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=bsMYDMUPVikPOtSqUcjvutIdASBnOg6zPNM7RSRSNJI=;
	b=Te3EivzosRk5arz9Qk1rId4CXBh0SDBHOyl641iJjSZdsa/4zUDvmJuxuUNp8Jb9rl
	dpckoIiuTPv508gJiXV5QW30zjuI1si15fPY3Lap+FvO+e56Ec02sfLwHTj39bvR7bjY
	oAW0DZyGYjVX5yZjXWxhL+VrtpGDmVIIaUNFtuX24OuBTdefepTY243myTkx2obSUnq6
	eMfGlz5wPECf8wI9ElXJ5yGTIZ5eV9E0P/zkYCl+jRIUmpRhsFv1hLDq4/DKZIlFEI0n
	44Uuw8FDvfP7KCSvPo8Lvl7x83+BBItNnppT3++mLNo5ySX+L7Cx0BnWuoHoGcwmk/w0
	yVew==
X-Received: by 10.28.174.68 with SMTP id x65mr2215948wme.51.1448992518216;
	Tue, 01 Dec 2015 09:55:18 -0800 (PST)
Received: from [192.168.0.11] ([81.56.255.191])
	by smtp.googlemail.com with ESMTPSA id
	uq3sm52557519wjc.10.2015.12.01.09.55.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Dec 2015 09:55:16 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <1448974975-31352-1-git-send-email-funman@videolan.org>
	<CAMKF1soAm3fR=SMc1c+YHjQPRqGLv5L4wRn71yTUcMKhhfLGoQ@mail.gmail.com>
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <565DDF01.6020008@videolan.org>
Date: Tue, 1 Dec 2015 18:55:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soAm3fR=SMc1c+YHjQPRqGLv5L4wRn71yTUcMKhhfLGoQ@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] net-snmp: apply patch for cross-compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Dec 2015 17:55:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 01/12/2015 17:48, Khem Raj wrote:
> On Tue, Dec 1, 2015 at 5:02 AM, Rafaël Carré <funman@videolan.org> wrote:
>>          file://0001-config_os_headers-Error-Fix.patch \
>> +        file://0002-config_os_headers-Error-Fix.patch \
> 
> these two names look pretty similar. Can you check if these both
> patches are needed

Why yes they're both needed, both make configure look at host header path.

