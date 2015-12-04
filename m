Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 97A0B6612D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 23:01:53 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so95165978wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2015 15:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0I2vizLtuoCmQPsoMIpDeCoILdd5/36Gve+wXlsW8TM=;
	b=gTndpUQ27uatTe9UjtJ+dLKuW9a+dppOKT9DdX8fTW2YLiy8h/mraEOz/k1kIUCUzy
	9AQqRi0RWbgBjgl66X/GhhTt3sGibcIqsPpizt7PFtjwL0n/AJ1l5pkAVfDeyvJv60zP
	lNOH8PX3SqL6+xDs9MlN3keB3NQuzauN/+UBW8eLGxexNu65mHeJhxzZOXY0pFhPDSJP
	bu2q3Szn0RhZXpHaiaAmdBkOPi/x3tSq0EMFlfuuR0pz8RFx46J6O/9Va7NhDE/lJvbz
	lwEHd+qKmeKWuyojFnfBLbzoOziSjE9Esdeh098SSq9lVfI1wnJ1PMcmh1FD9vMvcPfC
	vQrg==
MIME-Version: 1.0
X-Received: by 10.194.116.170 with SMTP id jx10mr19712707wjb.166.1449270113562;
	Fri, 04 Dec 2015 15:01:53 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Fri, 4 Dec 2015 15:01:53 -0800 (PST)
In-Reply-To: <CA+chaQd+6fTZwYqVDSNb+zTEnr7dKZbmS5iYTxobtvn1OhZZpg@mail.gmail.com>
References: <DUB127-W22D1770BD32DBD895E41FCB80C0@phx.gbl>
	<CA+chaQd+6fTZwYqVDSNb+zTEnr7dKZbmS5iYTxobtvn1OhZZpg@mail.gmail.com>
Date: Sat, 5 Dec 2015 00:01:53 +0100
Message-ID: <CA+chaQd-YtjtkE8M0ZdPESsF2tneE5A74_RiyvmPSFx5h07yWQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: =?UTF-8?B?UmU6IFttZXRhLXF0NV0gR1N0cmVhbWVyLTEuMCBwYXRoIGJyZWFraW5nIDAuMSBzdXBwb3J04oCP?=
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
X-List-Received-Date: Fri, 04 Dec 2015 23:01:53 -0000
Content-Type: text/plain; charset=UTF-8

FWIW: there is also:
http://patchwork.openembedded.org/patch/88555/

also still waiting for v3 and I don't know if it was tested with 0.10
gstreamer.

On Fri, Dec 4, 2015 at 11:59 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> > Otherwise, why is the patch that seems to have been accepted in 2014 to
> fix the 1.0 breaking 0.1 support not been implemented in the layer yet?
>
> It's incorrectly marked as Accepted in patchwork, but it was never merged
> into the repository, because the author never sent v2 with review comments
> from me resolved.
>
> There was another patch:
> http://patchwork.openembedded.org/patch/85075/
> which was merged and nobody was reporting broken 0.10 support since then.
> I'm not using 0.10 version, so I was assuming it works now for people who
> do.
>
> Regards,
>
>
> On Fri, Dec 4, 2015 at 11:24 PM, Gerhard de Clercq <
> gerharddeclercq@outlook.com> wrote:
>
>> Hi,
>>
>> I've just wasted a lot of time trying to get qtmultimedia to compile on a
>> Fido build using the Fido branch of meta-qt5. After a lot of tinkering I
>> finally got it working and have found that the problem was caused by the
>> 0001-Initial-porting-effort-to-GStreamer-1.0.patch file that ships with the
>> layer. I initially didn't realize that the troublesome code was coming from
>> it and debugged the cached source (which it seems is patched) until it
>> worked. I didn't think it would be so easy but a patch
>> http://patchwork.openembedded.org/patch/79531/ I found from 2014
>> completely told me how to correct the source.
>>
>> What bothers me is how can this can be possible. Are the recipes designed
>> not to apply the patch to non 1.0 build and if so, what could prevent that
>> from working? Otherwise, why is the patch that seems to have been accepted
>> in 2014 to fix the 1.0 breaking 0.1 support not been implemented in the
>> layer yet?
>>
>> PS. I see the patch file has changed a bit after Fido but unfortunately
>> Fido is the latest that my board supports at the moment and I have not been
>> able to test with a newer version.
>>
>> Regards,
>> Gerhard de Clercq
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

