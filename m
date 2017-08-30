Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0DD605FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 09:40:56 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id d124so16113687vkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HqFugfPJcls+Rz6yA4tgtHIuaaZrVrldhe0qoNUwGG8=;
	b=pn5u7QAGmpCxcJzyb5AmPJjECrTctuZO0+cF4svi5P0VIo/kfLFzbZsFoEhSV0CVK/
	iNCQAs5bnRr7kQiciWFPYURnCzaTRPB2WJzn4UUTMSdEGSut+VPC48V4UPdwi2QGUXvk
	eEyv0UjEq2cqJV7lncZibLJMMgHmDiaEggHi4HkpOwORkLLBY4maDDPh772GjVIbk3vS
	WUq3XFAt9i5JHyUaZqmvMCGUjEddwPvNFBScgDqd+1ulb143F/9fJovj89A4wL9KfYEp
	RotnWTgl0eHhx0yPX/u8jx1CsfgLQoo4PZlPnmC17c8MtiWtACTXpmXZ7j+BWimN9y5F
	m2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HqFugfPJcls+Rz6yA4tgtHIuaaZrVrldhe0qoNUwGG8=;
	b=JPEXKcFHy/863Bw5M2/ezfJprlKtrHMP0/zp2Cbec/wG4VAHvURDSSSHkto/9Pg2u3
	JtMjC2KPDZenrZEbUM1HOXVZSdvXX/+FoH2zo27JJwP9ZK/0xIbsiaPrJaoMm9Nfm384
	Khs5GqyD+BYsRJCyk6J9nv1syDDVTN13dCBe4Bg2VBL5xDxrsLomUIOUxpdZiUU7z5KJ
	cclQILpryMnOTIAfD5vf9aD9+nZLoHtYnEavnoPISet0SGmpbqy1RxtIYzUkJOPg+JZ4
	1iXdd502E4BYetp2LPIhZY38k/I9VWLlj7pk8G63iVRj1sq1TemF5jLwsgZaQuyjpo/h
	VRqA==
X-Gm-Message-State: AHYfb5jCIdAnICqll40IsVuAG3sz3mnta4mrcZ6V/ZR4ux5DP4l0kyE0
	Ms8lFCwrhcaNyGYz5ApKEBrrP4Ig/w==
X-Received: by 10.31.169.9 with SMTP id s9mr566840vke.90.1504086058061; Wed,
	30 Aug 2017 02:40:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 30 Aug 2017 02:40:57 -0700 (PDT)
In-Reply-To: <0d3fb193-c3fe-9ad7-70f1-ac7d51a21bd1@windriver.com>
References: <20170828135913.7508-1-kai.kang@windriver.com>
	<0d3fb193-c3fe-9ad7-70f1-ac7d51a21bd1@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2017 11:40:57 +0200
Message-ID: <CA+chaQd6UWQDm7LmLF1vDxjyCBtDiO=gLuBJkzdjTsbPf8o=yw@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] krb5: fix CVE-2017-11368
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
X-List-Received-Date: Wed, 30 Aug 2017 09:40:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

done

On Wed, Aug 30, 2017 at 11:30 AM, Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2017=E5=B9=B408=E6=9C=8828=E6=97=A5 21:59, kai.kang@windriver.com wrot=
e:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Issue: CVE-2017-11368
>>
>> Backport patch to fix CVE-2017-11368 for krb5.
>>
>> (LOCAL REV: NOT UPSTREAM) -- Send to oe-devel on 20170828
>>
>
> Hi Martin,
>
> Ooops. I forgot to remove inner informations in the commit message.
>
> Should I send V2 to remove the following 2 lines?
>
> Issue: CVE-2017-11368
>
> (LOCAL REV: NOT UPSTREAM) -- Send to oe-devel on 20170828
>
>
> Sorry for the inconvenience.
>
>
> --Kai
>
>
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../krb5/krb5/fix-CVE-2017-11368.patch             | 116
>> +++++++++++++++++++++
>>   meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb   |   1 +
>>   2 files changed, 117 insertions(+)
>>   create mode 100644 meta-oe/recipes-connectivity/k
>> rb5/krb5/fix-CVE-2017-11368.patch
>>
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.p=
atch
>> b/meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch
>> new file mode 100644
>> index 000000000..a2eb7bc02
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch
>> @@ -0,0 +1,116 @@
>> +Upstream-Status: Backport [https://github.com/krb5/krb5/
>> commit/ffb35baac6981f9e8914f8f3bffd37f284b85970]
>> +
>> +Backport patch to fix CVE-2017-11368.
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> +From ffb35baac6981f9e8914f8f3bffd37f284b85970 Mon Sep 17 00:00:00 2001
>> +From: Greg Hudson <ghudson@mit.edu>
>> +Date: Thu, 13 Jul 2017 12:14:20 -0400
>> +Subject: [PATCH] Prevent KDC unset status assertion failures
>> +
>> +Assign status values if S4U2Self padata fails to decode, if an
>> +S4U2Proxy request uses invalid KDC options, or if an S4U2Proxy request
>> +uses an evidence ticket which does not match the canonicalized request
>> +server principal name.  Reported by Samuel Cabrero.
>> +
>> +If a status value is not assigned during KDC processing, default to
>> +"UNKNOWN_REASON" rather than failing an assertion.  This change will
>> +prevent future denial of service bugs due to similar mistakes, and
>> +will allow us to omit assigning status values for unlikely errors such
>> +as small memory allocation failures.
>> +
>> +CVE-2017-11368:
>> +
>> +In MIT krb5 1.7 and later, an authenticated attacker can cause an
>> +assertion failure in krb5kdc by sending an invalid S4U2Self or
>> +S4U2Proxy request.
>> +
>> +  CVSSv3 Vector: AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H/E:H/RL:O/RC:C
>> +
>> +ticket: 8599 (new)
>> +target_version: 1.15-next
>> +target_version: 1.14-next
>> +tags: pullup
>> +---
>> + src/kdc/do_as_req.c  |  4 ++--
>> + src/kdc/do_tgs_req.c |  3 ++-
>> + src/kdc/kdc_util.c   | 10 ++++++++--
>> + 3 files changed, 12 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/src/kdc/do_as_req.c b/src/kdc/do_as_req.c
>> +index 2d3ad13..9b256c8 100644
>> +--- a/src/kdc/do_as_req.c
>> ++++ b/src/kdc/do_as_req.c
>> +@@ -366,8 +366,8 @@ finish_process_as_req(struct as_req_state *state,
>> krb5_error_code errcode)
>> +     did_log =3D 1;
>> +
>> + egress:
>> +-    if (errcode !=3D 0)
>> +-        assert (state->status !=3D 0);
>> ++    if (errcode !=3D 0 && state->status =3D=3D NULL)
>> ++        state->status =3D "UNKNOWN_REASON";
>> +
>> +     au_state->status =3D state->status;
>> +     au_state->reply =3D &state->reply;
>> +diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
>> +index cdc79ad..d8d6719 100644
>> +--- a/src/kdc/do_tgs_req.c
>> ++++ b/src/kdc/do_tgs_req.c
>> +@@ -823,7 +823,8 @@ process_tgs_req(struct server_handle *handle,
>> krb5_data *pkt,
>> +     free(reply.enc_part.ciphertext.data);
>> +
>> + cleanup:
>> +-    assert(status !=3D NULL);
>> ++    if (status =3D=3D NULL)
>> ++        status =3D "UNKNOWN_REASON";
>> +     if (reply_key)
>> +         krb5_free_keyblock(kdc_context, reply_key);
>> +     if (errcode)
>> +diff --git a/src/kdc/kdc_util.c b/src/kdc/kdc_util.c
>> +index 778a629..b710aef 100644
>> +--- a/src/kdc/kdc_util.c
>> ++++ b/src/kdc/kdc_util.c
>> +@@ -1220,8 +1220,10 @@ kdc_process_for_user(kdc_realm_t
>> *kdc_active_realm,
>> +     req_data.data =3D (char *)pa_data->contents;
>> +
>> +     code =3D decode_krb5_pa_for_user(&req_data, &for_user);
>> +-    if (code)
>> ++    if (code) {
>> ++        *status =3D "DECODE_PA_FOR_USER";
>> +         return code;
>> ++    }
>> +
>> +     code =3D verify_for_user_checksum(kdc_context, tgs_session,
>> for_user);
>> +     if (code) {
>> +@@ -1320,8 +1322,10 @@ kdc_process_s4u_x509_user(krb5_context context,
>> +     req_data.data =3D (char *)pa_data->contents;
>> +
>> +     code =3D decode_krb5_pa_s4u_x509_user(&req_data, s4u_x509_user);
>> +-    if (code)
>> ++    if (code) {
>> ++        *status =3D "DECODE_PA_S4U_X509_USER";
>> +         return code;
>> ++    }
>> +
>> +     code =3D verify_s4u_x509_user_checksum(context,
>> +                                          tgs_subkey ? tgs_subkey :
>> +@@ -1624,6 +1628,7 @@ kdc_process_s4u2proxy_req(kdc_realm_t
>> *kdc_active_realm,
>> +      * that is validated previously in validate_tgs_request().
>> +      */
>> +     if (request->kdc_options & (NON_TGT_OPTION |
>> KDC_OPT_ENC_TKT_IN_SKEY)) {
>> ++        *status =3D "INVALID_S4U2PROXY_OPTIONS";
>> +         return KRB5KDC_ERR_BADOPTION;
>> +     }
>> +
>> +@@ -1631,6 +1636,7 @@ kdc_process_s4u2proxy_req(kdc_realm_t
>> *kdc_active_realm,
>> +     if (!krb5_principal_compare(kdc_context,
>> +                                 server->princ, /* after canon */
>> +                                 server_princ)) {
>> ++        *status =3D "EVIDENCE_TICKET_MISMATCH";
>> +         return KRB5KDC_ERR_SERVER_NOMATCH;
>> +     }
>> +
>> +--
>> +2.10.1
>> +
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
>> b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
>> index 1de884d03..b515eb5dc 100644
>> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
>> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
>> @@ -30,6 +30,7 @@ SRC_URI =3D "http://web.mit.edu/kerberos/d
>> ist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
>>              file://etc/default/krb5-admin-server \
>>              file://krb5-kdc.service \
>>              file://krb5-admin-server.service \
>> +           file://fix-CVE-2017-11368.patch;striplevel=3D2 \
>>   "
>>   SRC_URI[md5sum] =3D "8022f3a1cde8463e44fd35ef42731f85"
>>   SRC_URI[sha256sum] =3D "437c8831ddd5fde2a993fef425ded
>> b48468109bb3d3261ef838295045a89eb45"
>>
>
>
> --
> Regards,
> Neil | Kai Kang
>
>

