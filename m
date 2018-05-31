Return-Path: <ishitsuka.sc@ncos.nec.co.jp>
X-Greylist: delayed 588 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 31 May 2018 06:00:00 UTC
Received: from tyo162.gate.nec.co.jp (tyo162.gate.nec.co.jp [114.179.232.162])
	by mail.openembedded.org (Postfix) with ESMTP id 5BABF6025E
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 05:59:59 +0000 (UTC)
Received: from mailgate02.nec.co.jp ([114.179.233.122])
	by tyo162.gate.nec.co.jp (8.15.1/8.15.1) with ESMTPS id w4V5oC9I027292
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 14:50:12 +0900
Received: from mailsv02.nec.co.jp (mailgate-v.nec.co.jp [10.204.236.94])
	by mailgate02.nec.co.jp (8.15.1/8.15.1) with ESMTP id w4V5oCd7013538
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 14:50:12 +0900
Received: from mail01b.kamome.nec.co.jp (mail01b.kamome.nec.co.jp [10.25.43.2])
	by mailsv02.nec.co.jp (8.15.1/8.15.1) with ESMTP id w4V5nfIK017648
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 14:50:12 +0900
Received: from bpxc99gp.gisp.nec.co.jp ([10.38.151.143] [10.38.151.143]) by
	mail03.kamome.nec.co.jp with ESMTP id BT-MMP-855083;
	Thu, 31 May 2018 14:49:22 +0900
Received: from BPXM17GP.gisp.nec.co.jp ([10.38.151.209]) by
	BPXC15GP.gisp.nec.co.jp ([10.38.151.143]) with mapi id 14.03.0319.002;
	Thu, 31 May 2018 14:49:22 +0900
From: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] telnetd:Fix deadlock on cleanup
Thread-Index: AdP4opnhel8JbwgyREyagEFM6yE5Jg==
Date: Thu, 31 May 2018 05:49:21 +0000
Message-ID: <D3AF589C68C3694A8188BC776DB93B48A2F29163@BPXM17GP.gisp.nec.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.27.178.67]
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: Re: [OE-core] [PATCH] telnetd:Fix deadlock on cleanup
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
X-List-Received-Date: Thu, 31 May 2018 06:00:00 -0000
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBQbGVhc2UgY2hlY2sgd2lsbCBsYXRlc3QgbWFzdGVyLCBpZiB5b3UgY2FuIHJlcG9yZHVjZSB0
aGUgaXNzdWUgd2l0aCBtYXN0ZXIgdGhlbiB3ZSBjYW4gcmV2aXZlIHRoaXMgZGlzY3Vzc2lvbiBv
biB0aGUgcGF0Y2guDQoNCkkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWUgb24gcWVt
dXg4NiB3aXRoIHRoZSBsYXRlc3QgdmVyc2lvbi4NCg0KQnVpbGQgQ29uZmlndXJhdGlvbjoNCkJC
X1ZFUlNJT04gICAgICAgICAgID0gIjEuMzcuMCINCkJVSUxEX1NZUyAgICAgICAgICAgID0gIng4
Nl82NC1saW51eCINCk5BVElWRUxTQlNUUklORyAgICAgID0gInVuaXZlcnNhbCINClRBUkdFVF9T
WVMgICAgICAgICAgID0gImk1ODYtcG9reS1saW51eCINCk1BQ0hJTkUgICAgICAgICAgICAgID0g
InFlbXV4ODYiDQpESVNUUk8gICAgICAgICAgICAgICA9ICJwb2t5Ig0KRElTVFJPX1ZFUlNJT04g
ICAgICAgPSAiMi41Ig0KVFVORV9GRUFUVVJFUyAgICAgICAgPSAibTMyIGk1ODYiDQpUQVJHRVRf
RlBVICAgICAgICAgICA9ICIiDQptZXRhDQptZXRhLXBva3kNCm1ldGEteW9jdG8tYnNwICAgICAg
ID0gIm1hc3Rlcjo3MTlkMDY4YmRlNTVlZjI5YTM0NjhiYzA3NzlkNGNiMGMxMWU4YzFkIg0KbWV0
YS1vZQ0KbWV0YS1weXRob24NCm1ldGEtbmV0d29ya2luZyAgICAgID0gIm1hc3RlcjpiYjU3YmFj
ODQ1ZjNjZDE2MzQ4NjJmYTk4NjhiYzhlMjk0YmE3NGE5Ig0KDQpIb3cgdG8gcmVwcm9kdWNlOg0K
DQoxLiB0ZWxuZXQgZnJvbSBob3N0KDE5Mi4xNjguNy4xKSB0byBxZW11eDg2KDE5Mi4xNjguNy4y
KQ0KDQokIGNhdCAuL3RlbG5ldGQuc2gNCiAjIS9iaW4vc2gNCg0KIEhPU1Q9IjE5Mi4xNjguNy4y
Ig0KIFVTRVI9InJvb3QiDQoNCiB3aGlsZSA6DQogZG8NCiAgIGV4cGVjdCAtYyAiDQogICBzZXQg
dGltZW91dCAxMA0KICAgc3Bhd24gdGVsbmV0ICRIT1NUDQogICBleHBlY3QgbG9naW46XCAgOyBz
ZW5kIFwiJFVTRVJcclwiDQogICBleHBlY3QgXCIjIFwiIDsgc2VuZCBcImV4aXRcclwiDQogIj4g
L2Rldi9udWxsDQogZG9uZQ0KDQokIC4vdGVsbmV0ZC5zaCAmDQokIC4vdGVsbmV0ZC5zaCAmDQoN
CjIuIENoZWNrIHByb2Nlc3Mgc3RhdHVzIG9uIHFlbXV4ODYNCg0Kcm9vdCAgICAgICAzMjUgICAg
IDEgIDAgMDQ6NDEgPyAgICAgICAgMDA6MDA6MDEgL3Vzci9zYmluL3hpbmV0ZCAtcGlkZmlsZSAv
dmFyL3INCnJvb3QgICAgICAzMzI4ICAgMzI1ICAwIDA0OjQzID8gICAgICAgIDAwOjAwOjAwIGlu
LnRlbG5ldGQ6IDE5Mi4xNjguNy4xDQpyb290ICAgICAgMzMzMCAgMzMyOCAgMCAwNDo0MyA/ICAg
ICAgICAwMDowMDowMCBbc2hdIDxkZWZ1bmN0Pg0Kcm9vdCAgICAgIDMzNzQgICAzMjUgIDAgMDQ6
NDMgPyAgICAgICAgMDA6MDA6MDAgaW4udGVsbmV0ZDogMTkyLjE2OC43LjENCnJvb3QgICAgICAz
Mzc2ICAzMzc0ICAwIDA0OjQzID8gICAgICAgIDAwOjAwOjAwIFtzaF0gPGRlZnVuY3Q+DQpyb290
ICAgICAgMzQxNyAgIDMwNiAgMCAwNDo0NCB0dHlTMCAgICAwMDowMDowMCBwcyAtZWYNCg0KLT4g
Rm91bmQgZGVmdW5jdCBzaCBhbmQgaW4udGVsbmV0ZCh3YWl0aW5nIGZ1dGV4KS4gDQoNCnJvb3RA
cWVtdXg4Njp+IyBzdHJhY2UgLXAgMzMyOA0Kc3RyYWNlOiBQcm9jZXNzIDMzMjggYXR0YWNoZWQN
CmZ1dGV4KDB4NDUwNTVhMTgsIEZVVEVYX1dBSVRfUFJJVkFURSwgMiwgTlVMTF5Dc3RyYWNlOiBQ
cm9jZXNzIDMzMjggZGV0YWNoZWQNCiA8ZGV0YWNoZWQgLi4uPg0KDQpyb290QHFlbXV4ODY6fiMg
c3RyYWNlIC1wIDMzNzQNCnN0cmFjZTogUHJvY2VzcyAzMzc0IGF0dGFjaGVkDQpmdXRleCgweDQ1
MDU1YTE4LCBGVVRFWF9XQUlUX1BSSVZBVEUsIDIsIE5VTExeQ3N0cmFjZTogUHJvY2VzcyAzMzc0
IGRldGFjaGVkDQogPGRldGFjaGVkIC4uLj4NCg0KQmVzdCByZWdhcmRzLA0KU2VpaWNoaSBJc2hp
dHN1a2ENCg==


