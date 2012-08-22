Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4Cry-00057l-0R
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 17:29:23 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 08:16:10 -0700
Received: by obceq6 with SMTP id eq6so1311209obc.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 08:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=15dsZuag1mFEozRdgwJrY+pgbyLJEZzvgz/QlyH+tE4=;
	b=NUQW2aytRLNtf31zet7DXgFWk2XlYrrTRH842j3BtlhDWqHluwMAHl0rh3oBxL7FNu
	j6kUjJ/LbnTqN9KNl2/Ij9fekNOTINiD4U0Z84dHWjkfyGM0YMH/LDUfC2Pdi4xOEfJC
	SK5FJOcZ5vTNtO8R2/tgGDAyDJ8tRcVYSlbWg4GUV+lf4tZ7irIE1NSnpuTjpejlRBu5
	bGAry/7SfYm/oLrHP/MOOSKQ4GcPPWjKVs1hwn4iUIelhFLo3nO8leg+JK7yyU6AXVdr
	Jt/RqMmZk8K2OmEhbRiMInHPf2jWn/uQHM9aCJ/SD54V/ZNPB2LbnjdmAK1KYLyu6ZFl
	g6Tw==
Received: by 10.182.50.68 with SMTP id a4mr16170901obo.59.1345648569346; Wed,
	22 Aug 2012 08:16:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 08:15:47 -0700 (PDT)
In-Reply-To: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 16:15:47 +0100
Message-ID: <CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnoaO6l8ihJ83TE5+KO4Y3cIA+P+hly+Z7TeHN27A81/SbMXxof8VKtjfz1pK8fa5AS8e//
Subject: Re: RFC: One X Server To Rule Them All
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
X-List-Received-Date: Wed, 22 Aug 2012 15:29:23 -0000
Content-Type: text/plain; charset=UTF-8

On 17 August 2012 13:12, Burton, Ross <ross.burton@intel.com> wrote:
> 1) Investigate differences between xorg/xorg-lite/kdrive, producing a
> feature matrix and binary size comparison

Some rough numbers: a core-image-sato rootfs for RouterStation Pro
using kdrive is 25959477 bytes.  Change kdrive to Xorg (Xfbdev and a
few important modules) and it grows to 26342094 bytes, approximately
380kb growth.

It appears that we're also shipping libexa in the core server package,
when I think that can be split into a separate package as fbdev isn't
using it.  That will give us another 90kb back.

I'm happy with this size increase as a trade-off for using an X server
that is actually maintained.

Ross


