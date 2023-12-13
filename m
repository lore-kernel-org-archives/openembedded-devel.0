Return-Path: <p.chernikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77686C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 09:36:21 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.32256.1702460179898381280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 01:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-04 header.b=NUd0H73G;
 dkim=pass header.i=@yadro.com header.s=mta-03 header.b=fDvOwjaL;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: p.chernikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com EE205C000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1702460174; bh=e3uhChQxE3C1b4ba3E+bB/o242S1WFgBiBmhWcGj2js=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=NUd0H73GLbSa33FWF1Ltt6sDk0bvJS6R07GQ53R3AHMP/gTl4YniGLAXzrXvkP7PR
	 1/J2idVM8BIvDWvdb+WvKKKutqrJ4qHXlWPx0XJ+NVxffBAe2Do5wfP0LorieqHaFK
	 usLYq8hHk1sePFYlTH1LiV7EjRP76r1DVzFYZkidKpwAm0CjiiuLgjSKHiKQVRCj/q
	 NfphB1r1RDN2/t496u/NoD60DXHdQ1H+ZBLYhvqhCV+HxFwk3l4BA42WAb/O9RvuXS
	 rilTfCPrn+nu1qGtzNG2vijy8xch7Jlz3KQ310O/a9yEZywLDDDfp0UkCCRWIyAwB3
	 0d8+ENELMg9aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1702460174; bh=e3uhChQxE3C1b4ba3E+bB/o242S1WFgBiBmhWcGj2js=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=fDvOwjaLJjkUgL3Ux2nBaJ+IG+Nqay41YUPlxq+iqKhgcpPF6uuiE2+1fn4I6GIYE
	 MZzAmoKu6HqVMJInYD7bGr2THJiU4KkmvYUgzrkoFlABAbymHZZ4/I16xCG6TBvNzf
	 Fl9d8OY8sTGWG8IXvbGcYzpMV1JwTwn7AGjg7Be8UilzH24JbWHeDyOCpo5YB4ATDE
	 v171ZFeTFyqh0xcqJaVkoZH7A63GAx/mnFDKlQk4pJJxztTHC7RfwV9UiWPOwpAK48
	 SFeVXLfiIVK6UNa5cNi9nXutA89i5TJodaf3mO4C5UhdcBvXaCByjc6TVdYCoOmUcb
	 W/Fclky/R8Bug==
From: Petr Chernikov <p.chernikov@yadro.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from
 extra_oecmake
Thread-Topic: [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from
 extra_oecmake
Thread-Index: AQHaKZondrMREZt1lUeVMpmhYoE+EbCmoJoAgABbrIA=
Date: Wed, 13 Dec 2023 09:36:13 +0000
Message-ID: <29eeadc9f91a4215a34362209ab9ce7b@yadro.com>
References: <20231208054757.1466187-1-p.chernikov@yadro.com>
 <170245125660.133993.1006521853362378038.b4-ty@gmail.com>
In-Reply-To: <170245125660.133993.1006521853362378038.b4-ty@gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 09:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107391

VGhhbmsgeW91IFJhaiENCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDEz
LCAyMDIzIDEwOjA4IEFNDQpUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc7IFBldHIgQ2hlcm5pa292IDxwLmNoZXJuaWtvdkB5YWRyby5jb20+DQpTdWJqZWN0OiBS
ZTogW1BBVENIXSBhYnNlaWwtY3BwOiByZW1vdmUgLURjbWFrZV9jeHhfc3RhbmRhcmQ9MTQgZmxh
ZyBmcm9tIGV4dHJhX29lY21ha2UNCg0KT24gRnJpLCAwOCBEZWMgMjAyMyAwODo0Nzo1NyArMDMw
MCwgUGV0ciBDaGVybmlrb3Ygd3JvdGU6DQo+IE9sZCB2ZXJzaW9ucyBvZiBhYnNlaWwtY3BwIGNv
dWxkIG5vdCBiZSBjb21waWxlZCB1c2luZyBDKysgU3RhbmRhcmQgMTcuDQo+IEZvciBub3cgdGhp
cyBjbWFrZSBmbGFnIGlzIG5vdCBuZWVkZWQuDQo+IE1vc2ggY29tcGlsYXRpb24gZml4ZWQgYnkg
c3BlY2lmeWluZyBjKysxNyBzdGFuZGFyZC4NCj4NCj4NCg0KQXBwbGllZCwgdGhhbmtzIQ0KDQpb
MS8xXSBhYnNlaWwtY3BwOiByZW1vdmUgLURjbWFrZV9jeHhfc3RhbmRhcmQ9MTQgZmxhZyBmcm9t
IGV4dHJhX29lY21ha2UNCiAgICAgIGNvbW1pdDogMTkwZjdiNTBhYzNkN2QzMGNmOWQzMTE2N2Zi
NzRmNzE0NmMzYzhmZg0KDQpCZXN0IHJlZ2FyZHMsDQotLQ0KS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4NCg0K

