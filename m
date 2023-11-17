Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C2BC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 18:58:05 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.3686.1700247476607482725
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 10:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G077ifa0;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1801247a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 10:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700247476; x=1700852276; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKAq/1JbjEjkEotbwCCFRia38Ng8dBbgr692Ct3wlm0=;
        b=G077ifa0ndFUNKAS/51NziJ1qzHZwR14ZbFV1vpr8VqQ8ly5rnruNi4ERDw4YQcJD8
         J+xuLPNFuFgdYPiMWN5Xth3Gk2oAcU8U+Gd4dKlGhOKNqCZ3jretmb0LKO2zt0/VBuR4
         VC4gkbYKRCVEBTstzbo7dU4P+W/HNnJ9WmejIYgpWHM17ym2nhruPcvISntq+Pvp4BZ5
         E6DMvAP6vnqRxCr0kUV7cvDEPKVUUswJ4VDkT7NWDpBAZ2DzDpVkj7MT63WBGiBBl6LC
         GhAv0wjlSiBdTc2BMoukPb/JcLBg5rx6HJrP2qZoZMbA7nDLCCkP4OVmIvfNhMKfEmn6
         JBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700247476; x=1700852276;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKAq/1JbjEjkEotbwCCFRia38Ng8dBbgr692Ct3wlm0=;
        b=pG2l/enVyGVme058JkaXp3doVLb5djFW6Sla6866CKdtn9Qtgd3NSC/YiigStZt1DF
         AIQKclBaFxNhpfsmKTsPDh39EQSPnRpWyaE0LJvShnfCaJhztfc35DX26v0rN5pR19cM
         FTnVTErDwxXQpdynFaiS9p2/jHoU81ezeVuuA4svGfmk4AEEzQwD+TZBVFlUlDZJdZuX
         BeBOD6IJUiJWHtypJdisqhE8Ltl88HuzkVPv2S4086Mili6U9ucVMDG8zQ1oUIzs4yoh
         8bHAom8zXdbmpPLJ4v0ttbTQCLtfD/7P3ssyf17xXwzGAKLgrRjpFtWjnpk0pRBItT0l
         UcNA==
X-Gm-Message-State: AOJu0Yxr2mLuyKBPUlbi5RG76AqPPoXbAuYH38Au11Ibmc27zO2EL9I2
	I6RAMyv953zcHxsKV9Rg9Xs=
X-Google-Smtp-Source: AGHT+IHXuM0Al4blNymDQlJiPLOAAQVSl7nCp/cqSedutRUrSLI6bT36GLe/50TVYaHNFql/tlXYDg==
X-Received: by 2002:a05:6a20:2446:b0:187:b7eb:944d with SMTP id t6-20020a056a20244600b00187b7eb944dmr73781pzc.13.1700247475825;
        Fri, 17 Nov 2023 10:57:55 -0800 (PST)
Received: from ?IPV6:2601:646:9100:2cb0:55cc:739f:66bb:a991? ([2601:646:9100:2cb0:55cc:739f:66bb:a991])
        by smtp.gmail.com with ESMTPSA id h124-20020a636c82000000b005bd980cca56sm1702391pgc.29.2023.11.17.10.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 10:57:55 -0800 (PST)
Message-ID: <6b6884fd-c6c5-4a43-adf8-0b0777a01a2d@gmail.com>
Date: Fri, 17 Nov 2023 10:57:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mickeldore merge request: Nov 17th.
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <5cd95dd6-6410-4f51-be8e-40b3a01f6191@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <5cd95dd6-6410-4f51-be8e-40b3a01f6191@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0TG6602ze20FpUeUv4Awbs8Q"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 18:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106874

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0TG6602ze20FpUeUv4Awbs8Q
Content-Type: multipart/mixed; boundary="------------3LgnST8EeE16r2YnknCwhyWu";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Message-ID: <6b6884fd-c6c5-4a43-adf8-0b0777a01a2d@gmail.com>
Subject: Re: mickeldore merge request: Nov 17th.
References: <5cd95dd6-6410-4f51-be8e-40b3a01f6191@gmail.com>
In-Reply-To: <5cd95dd6-6410-4f51-be8e-40b3a01f6191@gmail.com>

--------------3LgnST8EeE16r2YnknCwhyWu
Content-Type: multipart/mixed; boundary="------------EMMjxDDLclScdYkeCFFqSNgC"

--------------EMMjxDDLclScdYkeCFFqSNgC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

bWVyZ2VkIHRoYW5rcyBBcm1pbi4NCg0KDQpPbiAxMS8xNy8yMyA3OjMzIEFNLCBha3VzdGVy
ODA4IHdyb3RlOg0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IA0KPiAz
OTk2ODgzNzE5NmNiNDgyMDliNzFlODg1MmRkMDRhMmY4Y2NkY2E4Og0KPiANCj4gIMKgIG5n
aW54OiBhZGQgY29uZmlndXJlIG9wdGlvbiAoMjAyMy0xMC0xNSAxOTowOTo0MiAtMDQwMCkN
Cj4gDQo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiANCj4g
IMKgIGh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQgbWlj
a2xlZG9yZS1uZXh0DQo+IA0KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYWE1
ZThlZGFiYmM0MTRkOGVjMWIyYWQ2M2M4NzQzYzdiYWY5OTYyNjoNCj4gDQo+ICDCoCBubG9o
bWFubi1qc29uOiBBZGQgcHRlc3Qgc3VwcG9ydCAoMjAyMy0xMS0xNiAyMTo0OToxNSAtMDUw
MCkNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gQXJjaGFuYSBQb2xhbXBhbGxpICgyKToNCj4gIMKg
wqDCoMKgwqAgbm9kZWpzOiBVcGdyYWRlIDE4LjE3LjEgLT4gMTguMTguMg0KPiAgwqDCoMKg
wqDCoCBvcGVuLXZtLXRvb2xzOiBmaXggQ1ZFLTIwMjMtMzQwNTgNCj4gDQo+IENoYW5ncWlu
ZyBMaSAoMSk6DQo+ICDCoMKgwqDCoMKgIGNwdWlkOiBmaXggZG9faW5zdGFsbA0KPiANCj4g
Sm9lIFNsYXRlciAoMSk6DQo+ICDCoMKgwqDCoMKgIHB5dGhvbjMtcHluYWNsOiBhZGQgUkNP
TkZMSUNUUyB3aXRoIHB5dGhvbjMtbmFjbA0KPiANCj4gTWluZ2xpIFl1ICgxKToNCj4gIMKg
wqDCoMKgwqAgbmxvaG1hbm4tanNvbjogQWRkIHB0ZXN0IHN1cHBvcnQNCj4gDQo+IE5hcnBh
dCBNYWxpICgxKToNCj4gIMKgwqDCoMKgwqAgdHJhY2Vyb3V0ZTogdXBncmFkZSAyLjEuMiAt
PiAyLjEuMw0KPiANCj4gU291cmF2IFByYW1hbmlrICgxKToNCj4gIMKgwqDCoMKgwqAgbmxv
aG1hbm4tanNvbjogQXZvaWQgdXNhZ2Ugb2Ygbm9icmFuY2g9MQ0KPiANCj4gV2FuZyBNaW5n
eXUgKDEpOg0KPiAgwqDCoMKgwqDCoCBwb3N0Z3Jlc3FsOiB1cGdyYWRlIDE1LjMgLT4gMTUu
NA0KPiANCj4gWWkgWmhhbyAoMik6DQo+ICDCoMKgwqDCoMKgIG1iZWR0bHM6IHVwZ3JhZGUg
Mi4yOC4zIC0+IDIuMjguNQ0KPiAgwqDCoMKgwqDCoCBsaWJzc2g6IHVwZ3JhZGUgMC4xMC40
IC0+IDAuMTAuNQ0KPiANCj4gIMKgLi4uL21iZWR0bHMve21iZWR0bHNfMi4yOC4zLmJiID0+
IG1iZWR0bHNfMi4yOC41LmJifSB8wqDCoCAyICstDQo+ICDCoC4uLi9vcGVuLXZtLXRvb2xz
L29wZW4tdm0tdG9vbHMvQ1ZFLTIwMjMtMzQwNTgucGF0Y2jCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMjQxIA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICDCoC4uLi9y
ZWNpcGVzLXN1cHBvcnQvb3Blbi12bS10b29scy9vcGVuLXZtLXRvb2xzXzEyLjEuNS5iYsKg
wqDCoMKgwqDCoCB8IDEgKw0KPiAgwqAuLi4vdHJhY2Vyb3V0ZS97dHJhY2Vyb3V0ZV8yLjEu
Mi5iYiA9PiB0cmFjZXJvdXRlXzIuMS4zLmJifSB8wqDCoCAyICstDQo+ICDCoC4uLi8wMDAx
LWNvbmZpZ3VyZS5hYy1ieXBhc3MtYXV0b2NvbmYtMi42OS12ZXJzaW9uLWNoZWNrLnBhdGNo
wqAgfCA4ICstDQo+ICDCoC4uLi9wb3N0Z3Jlc3FsL3twb3N0Z3Jlc3FsXzE1LjMuYmIgPT4g
cG9zdGdyZXNxbF8xNS40LmJifSB8wqDCoCAyICstDQo+ICDCoG1ldGEtb2UvcmVjaXBlcy1k
ZXZ0b29scy9jcHVpZC9jcHVpZF8yMDIxMTEyOS5iYsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDEwICstDQo+ICDCoC4uLjAwMS1NYWtlZmlsZS11cGRhdGUtdGhlLWhhcmRj
b2RlLXBhdGgtdG8tYmluZGlyLW1hbmRpci5wYXRjaCB8IDM2IA0KPiArKysrKw0KPiAgwqAu
Li4wMDAxLWN1c3RvbS1hbGxvY2F0b3JzLWRlZmluZS1taXNzaW5nLXJlYmluZC10eXBlLTM4
OTUucGF0Y2ggfCA2MSANCj4gKysrKysrKw0KPiAgwqAuLi4xLXRlc3RzLXVuaXQtaXRlcmF0
b3JzMi11c2Utc3RkLXJhbmdlcy1lcXVhbHMtZm9yLXJhbmcucGF0Y2ggfCAzMSArKysrDQo+
ICDCoG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ubG9obWFubi1qc29uL2ZpbGVzL3J1bi1w
dGVzdMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICsrDQo+ICDCoG1ldGEtb2UvcmVjaXBlcy1k
ZXZ0b29scy9ubG9obWFubi1qc29uL25sb2htYW5uLWpzb25fMy4xMS4yLmJiwqAgfCAyNCAr
Ky0NCj4gIMKgLi4uL29lLW5wbS1jYWNoZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCAwDQo+ICDCoC4uLm9lLWNhY2hlLW5hdGl2ZV8xOC4xNy5iYiA9PiBu
b2RlanMtb2UtY2FjaGUtbmF0aXZlXzE4LjE4LmJifSB8wqDCoCAwDQo+ICDCoC4uLi9ub2Rl
anMve25vZGVqc18xOC4xNy4xLmJiID0+IG5vZGVqc18xOC4xOC4yLmJifSB8wqDCoCA0ICst
DQo+ICDCoG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnNzaC9saWJzc2gvcnVuLXB0ZXN0
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0MiANCj4gKy0tLS0NCj4gIMKg
Li4uL2xpYnNzaC97bGlic3NoXzAuMTAuNC5iYiA9PiBsaWJzc2hfMC4xMC41LmJifSB8wqDC
oCA1ICstDQo+ICDCoG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHluYWNsXzEuNS4wLmJiwqDCoMKgwqAgfCA0ICsNCj4gIMKgMTggZmlsZXMgY2hhbmdl
ZCwgNDI5IGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQ0KPiAgwqByZW5hbWUgbWV0
YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L21iZWR0bHMve21iZWR0bHNfMi4y
OC4zLmJiIA0KPiA9PiBtYmVkdGxzXzIuMjguNS5iYn0gKDk4JSkNCj4gIMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IA0KPiBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L29wZW4tdm0t
dG9vbHMvb3Blbi12bS10b29scy9DVkUtMjAyMy0zNDA1OC5wYXRjaA0KPiAgwqByZW5hbWUg
bWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC90cmFjZXJvdXRlL3t0cmFjZXJvdXRl
XzIuMS4yLmJiIA0KPiA9PiB0cmFjZXJvdXRlXzIuMS4zLmJifSAoOTQlKQ0KPiAgwqByZW5h
bWUgbWV0YS1vZS9yZWNpcGVzLWRicy9wb3N0Z3Jlc3FsL3twb3N0Z3Jlc3FsXzE1LjMuYmIg
PT4gDQo+IHBvc3RncmVzcWxfMTUuNC5iYn0gKDg0JSkNCj4gIMKgY3JlYXRlIG1vZGUgMTAw
NjQ0IA0KPiBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY3B1aWQvZmlsZXMvMDAwMS1NYWtl
ZmlsZS11cGRhdGUtdGhlLWhhcmRjb2RlLXBhdGgtdG8tYmluZGlyLW1hbmRpci5wYXRjaA0K
PiAgwqBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9u
bG9obWFubi1qc29uL2ZpbGVzLzAwMDEtY3VzdG9tLWFsbG9jYXRvcnMtZGVmaW5lLW1pc3Np
bmctcmViaW5kLXR5cGUtMzg5NS5wYXRjaA0KPiAgwqBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+
IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ubG9obWFubi1qc29uL2ZpbGVzLzAwMDEtdGVz
dHMtdW5pdC1pdGVyYXRvcnMyLXVzZS1zdGQtcmFuZ2VzLWVxdWFscy1mb3ItcmFuZy5wYXRj
aA0KPiAgwqBjcmVhdGUgbW9kZSAxMDA3NTUgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL25s
b2htYW5uLWpzb24vZmlsZXMvcnVuLXB0ZXN0DQo+ICDCoHJlbmFtZSBtZXRhLW9lL3JlY2lw
ZXMtZGV2dG9vbHMvbm9kZWpzL3tub2RlanMtb2UtY2FjaGUtMTguMTcgPT4gDQo+IG5vZGVq
cy1vZS1jYWNoZS0xOC4xOH0vb2UtbnBtLWNhY2hlICgxMDAlKQ0KPiAgwqByZW5hbWUgDQo+
IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ub2RlanMve25vZGVqcy1vZS1jYWNoZS1uYXRp
dmVfMTguMTcuYmIgPT4gDQo+IG5vZGVqcy1vZS1jYWNoZS1uYXRpdmVfMTguMTguYmJ9ICgx
MDAlKQ0KPiAgwqByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL25vZGVqcy97bm9k
ZWpzXzE4LjE3LjEuYmIgPT4gDQo+IG5vZGVqc18xOC4xOC4yLmJifSAoOTclKQ0KPiAgwqBy
ZW5hbWUgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlic3NoL3tsaWJzc2hfMC4xMC40LmJi
ID0+IA0KPiBsaWJzc2hfMC4xMC41LmJifSAoODUlKQ0KPiANCg==
--------------EMMjxDDLclScdYkeCFFqSNgC
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------EMMjxDDLclScdYkeCFFqSNgC--

--------------3LgnST8EeE16r2YnknCwhyWu--

--------------0TG6602ze20FpUeUv4Awbs8Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZVe3sgUDAAAAAAAKCRC7BTNVkZ0zFKNw
AJ9GKfXIKEXnmlTSZWk2YBF078EK+wCfcLrnQh0SKlfk90OPCveV61iOVQ0=
=nEoS
-----END PGP SIGNATURE-----

--------------0TG6602ze20FpUeUv4Awbs8Q--

