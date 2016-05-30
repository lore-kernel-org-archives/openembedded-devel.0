Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1C871731DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 07:37:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n129so19782242wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 00:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=J959oVqSSoMb3I1qr7D/cc58ekbH/NbU6kaWGrn71/g=;
	b=DDNFocg1oFzgMVKDYSaxZy/AyW/Gynn0z3P+uZpdA00COeDzVSV9ZUY4xYaQ19K34P
	zmzkYR4F0jxmm5AQLKIlTRTRyhhRYCfg45cs7Qss/BLNNwUXikVEMdJ8yWpdQtuYhcae
	1NOdNavVkICI/QSnFxxNxhumFuH0zvLvw14dWTaP/g/e+eOAP2yr3RnPfzPri3dBE35f
	6RY3VyXxcy0zvryXrIx6Q4mOKRRF5tvuhgH05FMkD/CmMD7l8EALMciMS008/s8l78IG
	M91teuA5kEyaxR4HXkAwdwgDya/ele+UpWgsOT2Cy+hp0VuZuoCapPGZVDLEEkxXhVRX
	T7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=J959oVqSSoMb3I1qr7D/cc58ekbH/NbU6kaWGrn71/g=;
	b=DdAsUPex5CWq27EEgl24Q+MGmsiGg72uxf+wCWk9KfNV4vGVLt2BPj+URBMPxcATNH
	0vrJmLk131P2erC207SLhC872Mv5lHiMRiDRJaa4HFDslx48lbnPmdXr+QQvsUs9XPiY
	r4bttdS/E3M+UWWO0cMBeuF+2tmkG8Wa5vC0Gk/bhBpkzX5ERHqx6E/+4vC3dBSugJ25
	KpktR/E5nDu57RqjJrA+5H6zDJYluoNafyd2X07vRVUiW3sFDov3pYIXXGI1JsCrSQkO
	dfml6f6SPWcKRBjbAoO1Zjk7v6yjakCp3VT2MBuQkBdFH5X+D36lLtkkopil2JJxcn44
	eWkQ==
X-Gm-Message-State: ALyK8tJHGbKgNHSXyQBh/nGMQy4Vh5SX18xYb4J1Z2/aByYf5CYCJEAnJBvREKeBhkcePNCS6TzcTMi7QfNKKA==
X-Received: by 10.28.18.11 with SMTP id 11mr8843137wms.51.1464593822284; Mon,
	30 May 2016 00:37:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.3.131 with HTTP; Mon, 30 May 2016 00:36:32 -0700 (PDT)
In-Reply-To: <1614711.s4bvBbSZBc@peggleto-mobl.ger.corp.intel.com>
References: <1464054649898.9b34c448@Nodemailer>
	<17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRTxYZ-+ZFmxOCguBMbO5X4m6KTaM+jXVqmSBQ8pHuR9UA@mail.gmail.com>
	<1614711.s4bvBbSZBc@peggleto-mobl.ger.corp.intel.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Mon, 30 May 2016 09:36:32 +0200
Message-ID: <CAGiJk9f=t2VZrN1URi7uZuz-ChgT1QTEN0vaECM-t9jCcmPmHw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Cliff Brake <cbrake@bec-systems.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] Unmaintained layers
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
X-List-Received-Date: Mon, 30 May 2016 07:37:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2016-05-26 22:57 GMT+02:00 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Thu, 26 May 2016 22:42:35 Andreas M=C3=BCller wrote:
>> What about meta-kde4?
>
> It seems Samuel has switched himself to "Inactive" - we probably need som=
e
> kind of alert when the last active maintainer of a layer does that. For n=
ow
> I've at least added a note to the entry. Samuel, do you have any opinions=
 on
> what we should do with the listing? Or anyone else?
>

Hi,

IMO just drop it from the list.
If possible you could add a HTTP 301 forward to the web repo address,
that would at least avoid some of the broken links.

Or add a page with a list of all unsupported layers and the last known
web repository address, and use HTTP 301 forwards to that page.


--=20
Regards
Samuel

