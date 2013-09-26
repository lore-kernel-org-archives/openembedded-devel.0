Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id BCC096B389
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 10:02:55 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id gd11so660537vcb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=n4OdHagsXmetuTZVXOVWvcdFxB+A0J7OjsW69RABUQ4=;
	b=Vnu33XtCVrtL7xdhMxBr8SnaItCCU7WgT4CXDBikTsk4CmXp72kpPIc5od3LEJAKXq
	TZSyCuEvzGU+1CzBp1z/VxVQABL277cNu3kzUXyO48p6mlKT4BpPX2UKAKAVBvifIlBb
	9ZlOwZ2cAYI/sDTnxRB9kmQ6iof0EJN2v/z32qj1oGIvx51PtHPxZW5M9XrMmgwGBm4Q
	iJm34IgfaVlIdkyzIDh3oBU6qUrBr02keKaGl70rLU/aAxOpVbLyjyIuPcg9OXvmcGvH
	8THx/LLtgzUMR9eqbwA2h1qOR638ZaKW91plmJU5Fkv2Sv29yUcp/kiaLZ+mHhmhwTbj
	0VNg==
MIME-Version: 1.0
X-Received: by 10.220.92.68 with SMTP id q4mr70860vcm.93.1380189777334; Thu,
	26 Sep 2013 03:02:57 -0700 (PDT)
Received: by 10.52.236.129 with HTTP; Thu, 26 Sep 2013 03:02:57 -0700 (PDT)
In-Reply-To: <CAJTo0LagmtFYtGFzRGs5yxc8Ua60zFH298SyKwFKYrPH41Drvw@mail.gmail.com>
References: <1380188747-9731-1-git-send-email-schnitzeltony@googlemail.com>
	<52440392.5080908@communistcode.co.uk>
	<CAJTo0LagmtFYtGFzRGs5yxc8Ua60zFH298SyKwFKYrPH41Drvw@mail.gmail.com>
Date: Thu, 26 Sep 2013 12:02:57 +0200
Message-ID: <CALbNGRRLCyedKt4LN=8hN7OTABjH8iP7wU4DVB9JGsbcduChYw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] fix do_rootfs for images with dev-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Thu, 26 Sep 2013 10:02:56 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 26, 2013 at 11:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 September 2013 10:51, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> I ran into this problem the other day, and after speaking to Ross
>> Burton, he suggested that the better way to fix this is with:
>>
>> RDEPENDS_${PN}-dev = ""
>>
>> I'm starting to get the feeling that the dev-pkgs feature is also a
>> little broken, as it seems as though it doesn't handle cases where
>> sub-packages are installed, but the main package is not.
>
> Well, the problem is the default dependency on the main package in the
> -dev package, which happens whether or not the main package even
> exists.  That's why I prefer removing the dependency instead of
> creating empty packages just for the bad dependency.
>
agreed :)

Andreas

