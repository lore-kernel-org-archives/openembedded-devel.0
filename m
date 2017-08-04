Return-Path: <garbados@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 35E7A606CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Aug 2017 23:13:31 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t138so7180675wmt.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Aug 2017 16:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wQfgRS/ESzmDEnbQyzUapg0vlPXK/KQRl4QphBRA3aw=;
	b=nIW8yxi9A7XdmcsaSjr2vH9GL7iUG2swlo6InGn4x051SgwndxvkTUuDYYL1Dy5h0K
	lcjsOjYLxbIOUYHgbIzcQbSW2UtImyRT5ruSdHmHAjr4n5xu0zDX1eMTbdxHpKw/EOSn
	aEfgH+b4ist5bCDW0mxj1SEek/K1BvsQGFX+RF0JsDOWnyLNlLYXGdiQUzqavui74EZ9
	V/hpD6peg66SmRfmpEQs6KYOS2uwYRrkUZrSeyab1aOSf6kYXoPzr8J/Of5piYGEBT9t
	ZzIF6dhdNWY1yGqbNl6JvLkGaVBXYLQjoM15I84DfILCIpiiWEB2CyC9MhFcQb1cFjmB
	uphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wQfgRS/ESzmDEnbQyzUapg0vlPXK/KQRl4QphBRA3aw=;
	b=Y3BtAHrMxsdumY2kv96nm3nkHT47ZxCyA0bGbuV4C77/Si+HicCbCeeVLKyuqipqRM
	7o8kkRDLXHlUzvBfulUDaHqtXr8FmsgeBcYVtN7TIKDZR+5Mk3gF+VW7OZFMtKZg34E5
	AMV9xZpU6w5WqBuUT3sDk1cfmCQfJ8BwwXwcUiZv9w0fiMOpKpt/7MWBer0YsrmkEuZ2
	hkVh9X3StLbOySjVW3AWe+kVYjo6g9/GGNiJJm9sSFR9oE4/832OpZUo+xAGllp0XZFg
	7cC+JS8/MoGt0/gxJ/Z/m1LuKHTtCfe5cY8wvw45lw4sVLP8K5ikPffTlTHai6OSshBR
	wxYw==
X-Gm-Message-State: AIVw113Sy3bT0ueRqvK3cuXmFJZpkHjC1sJ+rt8hQ9TE0XyxpGfyDSIJ
	Vt4X06nNn1PCQ/H+2nvWJhi4Xcpd0g==
X-Received: by 10.80.208.147 with SMTP id v19mr4139483edd.92.1501888412946;
	Fri, 04 Aug 2017 16:13:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.167.164 with HTTP; Fri, 4 Aug 2017 16:12:52 -0700 (PDT)
In-Reply-To: <CAMKF1soVgTtENN2DG_ESg02coXAtjzuWn=jMt3ydhz_HdLfXbA@mail.gmail.com>
References: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
	<CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
	<CA++8a_BLciSLffmy_MyxyeSEWCX+07BkiQ4u80Rz+upJ1rzBdw@mail.gmail.com>
	<CAMKF1spBau=OW8iA2K=ULnkZ_fFvdiRupDsPeiL8bPhPfms2cg@mail.gmail.com>
	<CA++8a_CQEZBUGm_u04cA1EddT=QnMxgWqEY8ZJGiVrTnbaKmoA@mail.gmail.com>
	<CAMKF1soVgTtENN2DG_ESg02coXAtjzuWn=jMt3ydhz_HdLfXbA@mail.gmail.com>
From: Diana Thayer <garbados@gmail.com>
Date: Fri, 4 Aug 2017 16:12:52 -0700
Message-ID: <CA++8a_DgbopF2ssWZpNN9kgRiJyYS1gEtf4FuggBevsp=rL1tQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openwrt] Issues adding layer using readme instructions
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
X-List-Received-Date: Fri, 04 Aug 2017 23:13:32 -0000
Content-Type: text/plain; charset="UTF-8"

Great! Here's the PR <https://github.com/kraj/meta-openwrt/pull/22>.

Attempting to run `TCLIBC=musl MACHINE=qemux86 bitbake core-image-sato`
still fails with this error:

```
ERROR: iptables-1.6.1-r0 do_patch: Command Error: 'quilt --quiltrc
/home/garbados/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/iptables/1.6.1-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch 600-shared-libext.patch
patching file extensions/GNUmakefile.in
Hunk #1 succeeded at 50 (offset 1 line).
Hunk #2 succeeded at 87 (offset 1 line).
Hunk #3 succeeded at 114 (offset 1 line).
Hunk #4 succeeded at 123 (offset 1 line).
Hunk #5 succeeded at 146 (offset 1 line).
patching file iptables/Makefile.am
Hunk #1 succeeded at 8 (offset 2 lines).
Hunk #2 FAILED at 15.
Hunk #3 FAILED at 42.
2 out of 3 hunks FAILED -- rejects in file iptables/Makefile.am
Patch 600-shared-libext.patch does not apply (enforce with -f)
ERROR: iptables-1.6.1-r0 do_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/home/garbados/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/iptables/1.6.1-r0/temp/log.do_patch.21478
ERROR: Task
(/home/garbados/openembedded-core/meta/recipes-extended/iptables/iptables_1.6.1.bb:do_patch)
failed with exit code '1'
```

Like before, I'm not sure how to handle it.

On Fri, Aug 4, 2017 at 3:56 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Yes, please!
>
> On Fri, Aug 4, 2017 at 2:37 PM Diana Thayer <garbados@gmail.com> wrote:
>
>> That did the trick. Should I submit a patch to remove it?
>>
>> On Fri, Aug 4, 2017 at 2:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> Ok please look for this class being inherited in this layer and delete
>>> it it has been merged into image class in oe-core we should have kept an
>>> empty class in or-core for backward compatibility but that's another matter
>>>
>>> On Fri, Aug 4, 2017 at 2:30 PM Diana Thayer <garbados@gmail.com> wrote:
>>>
>>>> Alright. I've added it manually. I get this error:
>>>>
>>>> ```
>>>> ParseError at /home/garbados/openembedded-core/meta-openwrt/recipes-
>>>> core/images/openwrt-base-image.bb:5: Could not inherit file
>>>> classes/image_types_uboot.bbclass
>>>> ```
>>>>
>>>> This is also the error Toaster gives me when trying to build the layer.
>>>>
>>>> On Fri, Aug 4, 2017 at 2:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>>> Hi Diana
>>>>>
>>>>> Haven't seen anyone report this error thus far
>>>>> I would suggest to add the layer manually to
>>>>> Bblayer.conf and see how then you get better error messages during
>>>>> parse
>>>>>
>>>>> On Fri, Aug 4, 2017 at 1:45 PM Diana Thayer <garbados@gmail.com>
>>>>> wrote:
>>>>>
>>>>>> Hello!
>>>>>>
>>>>>> I'm experiencing issues building with meta-openwrt. Following the
>>>>>> instructions in the readme <https://github.com/kraj/meta-openwrt>, I
>>>>>> get
>>>>>> this error:
>>>>>>
>>>>>> ```
>>>>>> $ bitbake-layers add-layer ../meta-openwrt
>>>>>> NOTE: Starting bitbake server...
>>>>>> Loading cache: 100% |#############################
>>>>>> ############################################################
>>>>>> #########################|
>>>>>> Time: 0:00:00
>>>>>> Loaded 66 entries from dependency cache.
>>>>>> ERROR: Parse failure with the specified layer added
>>>>>>                                                           | ETA:
>>>>>> --:--:--
>>>>>> ```
>>>>>>
>>>>>> What failed? Why? How do I debug it? I followed the directions step by
>>>>>> step, both within openembedded-core and poky.
>>>>>>
>>>>>> Thanks for any help you can provide.
>>>>>>
>>>>>> Best regards,
>>>>>> Diana
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>
>>>>>
>>>>
>>

