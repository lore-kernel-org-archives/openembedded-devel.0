Received: from [128.222.32.20] (helo=mexforward.lss.emc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lin_Lynn@emc.com>) id 1MCtzT-0001TW-QE
	for openembedded-devel@openembedded.org; Sat, 06 Jun 2009 13:23:12 +0200
Received: from hop04-l1d11-si02.isus.emc.com (HOP04-L1D11-SI02.isus.emc.com
	[10.254.111.55])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	n56BDssL026750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 6 Jun 2009 07:13:54 -0400 (EDT)
From: Lin_Lynn@emc.com
Received: from mailhub.lss.emc.com (nagas.lss.emc.com [10.254.144.15]) by
	hop04-l1d11-si02.isus.emc.com (Tablus Interceptor) for
	<openembedded-devel@openembedded.org>; Sat, 6 Jun 2009 07:13:48 -0400
Received: from corpussmtp2.corp.emc.com (corpussmtp2.corp.emc.com
	[128.221.14.146])
	by mailhub.lss.emc.com (Switch-3.3.2mp/Switch-3.3.2mp) with ESMTP id
	n56BDlQt020946 for <openembedded-devel@openembedded.org>;
	Sat, 6 Jun 2009 07:13:48 -0400
Received: from CORPUSMX100C.corp.emc.com ([128.222.76.50]) by
	corpussmtp2.corp.emc.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 6 Jun 2009 07:13:47 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Sat, 6 Jun 2009 07:05:23 -0400
Message-ID: <065E68EB87448440A3E75B4DBB5E871C524DF3@CORPUSMX100C.corp.emc.com>
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Thread-Topic: [oe][patch] tmp.gz is a intermediate dir at last we should
	remove it 
Thread-Index: AcnmlrBpQyLf/bzcSCWkQnB1Vk8xhA==
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 06 Jun 2009 11:13:47.0104 (UTC)
	FILETIME=[DC86C600:01C9E697]
X-EMM-EM: Active
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [patch] tmp.gz is a intermediate dir at last we should remove it
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
X-List-Received-Date: Sat, 06 Jun 2009 11:23:12 -0000
X-Groupsio-MsgNum: 11079
Content-class: urn:content-classes:message
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C9E696.B330D166"

------_=_NextPart_001_01C9E696.B330D166
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: quoted-printable

Hi,all=20

In conf/bitbake.conf there is ext2 and ext3 image cmd.It create a =
${DEPLOY_DIR_IMAGE}/tmp.gz directory, however at last, seems that the =
dir isn=A1=AFt removed

The attach is to delete this intermediate dir=A1=A3


------_=_NextPart_001_01C9E696.B330D166
Content-Type: application/octet-stream;
	name="tmp.gz-is-a-intermediate-dir-at-last-we-should-remov.patch"
Content-Transfer-Encoding: base64
Content-Description: tmp.gz-is-a-intermediate-dir-at-last-we-should-remov.patch
Content-Disposition: attachment;
	filename="tmp.gz-is-a-intermediate-dir-at-last-we-should-remov.patch"

RnJvbSAzOTBiYzIyY2FiYjBhODgzNThlYzIyYTAzMGY5ZWQxOTk1MjE1MjY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMeW5uIExpbiA8TGluX0x5bm5AZW1jLmNvbT4KRGF0ZTogU2F0
LCA2IEp1biAyMDA5IDE4OjQ3OjM2ICswODAwClN1YmplY3Q6IFtQQVRDSF0gdG1wLmd6IGlzIGEg
aW50ZXJtZWRpYXRlIGRpcixhdCBsYXN0IHdlIHNob3VsZCByZW1vdmUgaXQKCi0tLQogY29uZi9i
aXRiYWtlLmNvbmYgfCAgICA0ICsrLS0KIDEgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NvbmYvYml0YmFrZS5jb25mIGIvY29uZi9i
aXRiYWtlLmNvbmYKaW5kZXggZTcxMWExZi4uZGI5MmY0NSAxMDA2NDQKLS0tIGEvY29uZi9iaXRi
YWtlLmNvbmYKKysrIGIvY29uZi9iaXRiYWtlLmNvbmYKQEAgLTM0MSw5ICszNDEsOSBAQCBJTUFH
RV9DTURfamZmczIgPSAibWtmcy5qZmZzMiAteCBsem8gLS1yb290PSR7SU1BR0VfUk9PVEZTfSAt
LWZha2V0aW1lIC0tb3V0cHV0PQogSU1BR0VfQ01EX3lhZmZzMiA9ICJta3lhZmZzMmltYWdlICR7
RVhUUkFfSU1BR0VDTUR9ICR7SU1BR0VfUk9PVEZTfSAke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1B
R0VfTkFNRX0ucm9vdGZzLnlhZmZzMiIKIElNQUdFX0NNRF9jcmFtZnMgPSAibWtjcmFtZnMgJHtJ
TUFHRV9ST09URlN9ICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS5yb290ZnMuY3Jh
bWZzICR7RVhUUkFfSU1BR0VDTUR9IgogSU1BR0VfQ01EX2V4dDIgPSAiZ2VuZXh0MmZzIC1iICR7
Uk9PVEZTX1NJWkV9IC1kICR7SU1BR0VfUk9PVEZTfSAke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1B
R0VfTkFNRX0ucm9vdGZzLmV4dDIgJHtFWFRSQV9JTUFHRUNNRH0iCi1JTUFHRV9DTURfZXh0Mi5n
eiA9ICJpbnN0YWxsIC1kICR7REVQTE9ZX0RJUl9JTUFHRX0vdG1wLmd6IDsgZ2VuZXh0MmZzIC1i
ICR7Uk9PVEZTX1NJWkV9IC1kICR7SU1BR0VfUk9PVEZTfSAke0RFUExPWV9ESVJfSU1BR0V9L3Rt
cC5nei8ke0lNQUdFX05BTUV9LnJvb3Rmcy5leHQyICR7RVhUUkFfSU1BR0VDTUR9OyBnemlwIC1m
IC05ICR7REVQTE9ZX0RJUl9JTUFHRX0vdG1wLmd6LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmV4dDI7
IG12ICR7REVQTE9ZX0RJUl9JTUFHRX0vdG1wLmd6LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmV4dDIu
Z3ogJHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LnJvb3Rmcy5leHQyLmd6IgorSU1B
R0VfQ01EX2V4dDIuZ3ogPSAiaW5zdGFsbCAtZCAke0RFUExPWV9ESVJfSU1BR0V9L3RtcC5neiA7
IGdlbmV4dDJmcyAtYiAke1JPT1RGU19TSVpFfSAtZCAke0lNQUdFX1JPT1RGU30gJHtERVBMT1lf
RElSX0lNQUdFfS90bXAuZ3ovJHtJTUFHRV9OQU1FfS5yb290ZnMuZXh0MiAke0VYVFJBX0lNQUdF
Q01EfTsgZ3ppcCAtZiAtOSAke0RFUExPWV9ESVJfSU1BR0V9L3RtcC5nei8ke0lNQUdFX05BTUV9
LnJvb3Rmcy5leHQyOyBtdiAke0RFUExPWV9ESVJfSU1BR0V9L3RtcC5nei8ke0lNQUdFX05BTUV9
LnJvb3Rmcy5leHQyLmd6ICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS5yb290ZnMu
ZXh0Mi5nejsgcm0gLXJmICR7REVQTE9ZX0RJUl9JTUFHRX0vdG1wLmd6IgogSU1BR0VfQ01EX2V4
dDMgPSAiZ2VuZXh0MmZzIC1iICR7Uk9PVEZTX1NJWkV9IC1kICR7SU1BR0VfUk9PVEZTfSAke0RF
UExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmV4dDMgJHtFWFRSQV9JTUFHRUNN
RH07IHR1bmUyZnMgLWogJHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LnJvb3Rmcy5l
eHQzIgotSU1BR0VfQ01EX2V4dDMuZ3ogPSAiaW5zdGFsbCAtZCAke0RFUExPWV9ESVJfSU1BR0V9
L3RtcC5neiA7IGdlbmV4dDJmcyAtYiAke1JPT1RGU19TSVpFfSAtZCAke0lNQUdFX1JPT1RGU30g
JHtERVBMT1lfRElSX0lNQUdFfS90bXAuZ3ovJHtJTUFHRV9OQU1FfS5yb290ZnMuZXh0MyAke0VY
VFJBX0lNQUdFQ01EfTsgdHVuZTJmcyAtaiAke0RFUExPWV9ESVJfSU1BR0V9L3RtcC5nei8ke0lN
QUdFX05BTUV9LnJvb3Rmcy5leHQzOyBnemlwIC1mIC05ICR7REVQTE9ZX0RJUl9JTUFHRX0vdG1w
Lmd6LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmV4dDM7IG12ICR7REVQTE9ZX0RJUl9JTUFHRX0vdG1w
Lmd6LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmV4dDMuZ3ogJHtERVBMT1lfRElSX0lNQUdFfS8ke0lN
QUdFX05BTUV9LnJvb3Rmcy5leHQzLmd6IgorSU1BR0VfQ01EX2V4dDMuZ3ogPSAiaW5zdGFsbCAt
ZCAke0RFUExPWV9ESVJfSU1BR0V9L3RtcC5neiA7IGdlbmV4dDJmcyAtYiAke1JPT1RGU19TSVpF
fSAtZCAke0lNQUdFX1JPT1RGU30gJHtERVBMT1lfRElSX0lNQUdFfS90bXAuZ3ovJHtJTUFHRV9O
QU1FfS5yb290ZnMuZXh0MyAke0VYVFJBX0lNQUdFQ01EfTsgdHVuZTJmcyAtaiAke0RFUExPWV9E
SVJfSU1BR0V9L3RtcC5nei8ke0lNQUdFX05BTUV9LnJvb3Rmcy5leHQzOyBnemlwIC1mIC05ICR7
REVQTE9ZX0RJUl9JTUFHRX0vdG1wLmd6LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmV4dDM7IG12ICR7
REVQTE9ZX0RJUl9JTUFHRX0vdG1wLmd6LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmV4dDMuZ3ogJHtE
RVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LnJvb3Rmcy5leHQzLmd6O3JtIC1yZiAke0RF
UExPWV9ESVJfSU1BR0V9L3RtcC5neiIKIElNQUdFX0NNRF9zcXVhc2hmcyA9ICJta3NxdWFzaGZz
ICR7SU1BR0VfUk9PVEZTfSAke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZz
LnNxdWFzaGZzICR7RVhUUkFfSU1BR0VDTUR9IC1ub2FwcGVuZCIKIElNQUdFX0NNRF9zcXVhc2hm
cy1sem1hID0gIm1rc3F1YXNoZnMtbHptYSAke0lNQUdFX1JPT1RGU30gJHtERVBMT1lfRElSX0lN
QUdFfS8ke0lNQUdFX05BTUV9LnJvb3Rmcy5zcXVhc2hmcy1sem1hICR7RVhUUkFfSU1BR0VDTUR9
IC1ub2FwcGVuZCIKIElNQUdFX0NNRF90YXIgPSAiY2QgJHtJTUFHRV9ST09URlN9ICYmIHRhciAt
Y3ZmICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS5yb290ZnMudGFyIC4iCi0tIAox
LjUuNC4zCgo=

------_=_NextPart_001_01C9E696.B330D166--
