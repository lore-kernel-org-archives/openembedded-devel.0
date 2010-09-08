Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=VA3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Ganesh.Petkar@kpitcummins.com>) id 1OtGZT-0007mN-4Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 11:04:00 +0200
Received: from mail63-va3-R.bigfish.com (10.7.14.241) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	8.1.340.0; Wed, 8 Sep 2010 08:48:09 +0000
Received: from mail63-va3 (localhost.localdomain [127.0.0.1])	by
	mail63-va3-R.bigfish.com (Postfix) with ESMTP id C59461C98167	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  8 Sep 2010 08:48:09 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VPS1(zzzz1202hzzz32i2a8h34h62h)
Received: from mail63-va3 (localhost.localdomain [127.0.0.1]) by mail63-va3
	(MessageSwitch) id 1283935689563249_26648;
	Wed,  8 Sep 2010 08:48:09 +0000 (UTC)
Received: from VA3EHSMHS028.bigfish.com (unknown [10.7.14.238])	by
	mail63-va3.bigfish.com (Postfix) with ESMTP id 85E7B21004D	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  8 Sep 2010 08:48:09 +0000 (UTC)
Received: from Kcinpunhjhc01.kpit.com (203.197.93.240) by
	VA3EHSMHS028.bigfish.com (10.7.99.38) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Wed, 8 Sep 2010 08:48:08 +0000
Received: from Kcinpunhjcms01.kpit.com ([172.10.16.121]) by
	Kcinpunhjhc01.kpit.com ([172.10.16.123]) with mapi;
	Wed, 8 Sep 2010 14:18:05 +0530
From: "Ganesh M. Petkar" <Ganesh.Petkar@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Sep 2010 14:18:05 +0530
Thread-Topic: Pulseaudio plugin
Thread-Index: AQHLTzJMhzL8kHFyhkO7+VKLIMOHBg==
Message-ID: <76E258664B189C4CBEF125491CA11ECC945B662B53@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: Kcinpunhjhc01.kpit.com
X-SA-Exim-Connect-IP: 216.32.180.11
X-SA-Exim-Mail-From: Ganesh.Petkar@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Pulseaudio plugin
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
X-List-Received-Date: Wed, 08 Sep 2010 09:04:00 -0000
X-Groupsio-MsgNum: 23300
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_76E258664B189C4CBEF125491CA11ECC945B662B53KCINPUNHJCMS0_"

--_002_76E258664B189C4CBEF125491CA11ECC945B662B53KCINPUNHJCMS0_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
i have added pulseaudio, gstremer and gst-plugin-pulse to OE and it generat=
ing libraries into  respective folder but when i try to check using gstreme=
r it giving error as illegal instruction.
Gstreamer is working because i have tried with alsa as sink but if try with=
 pulse audio it is not working.
I have used following command to test =

    gst-launch filesrc location=3D/home/OE/Test.wav ! wavparse ! audioconve=
rt ! audioresample ! pulsesink.

find the Pulseaudio.inc and let me know is it correct or not.

Let me what are i need do add to make pluseaudio working.

Regards,
Ganesh


--_002_76E258664B189C4CBEF125491CA11ECC945B662B53KCINPUNHJCMS0_
Content-Type: application/octet-stream; name="pulseaudio.inc"
Content-Description: pulseaudio.inc
Content-Disposition: attachment; filename="pulseaudio.inc"; size=4729;
	creation-date="Wed, 08 Sep 2010 14:16:28 GMT";
	modification-date="Wed, 08 Sep 2010 14:16:28 GMT"
Content-Transfer-Encoding: base64

REVTQ1JJUFRJT04gPSAiUHVsc2VhdWRpbyBpcyBhIHNvdW5kIHNlcnZlciBmb3IgTGludXggYW5k
IFVuaXgtbGlrZSBvcGVyYXRpbmcgc3lzdGVtcy4iCkhPTUVQQUdFID0gImh0dHA6Ly93d3cucHVs
c2VhdWRpby5vcmciCkFVVEhPUiA9ICJMZW5uYXJ0IFBvZXR0ZXJpbmciClNFQ1RJT04gPSAibGli
cy9tdWx0aW1lZGlhIgpMSUNFTlNFID0gIkxHUEwiCiNERVBFTkRTID0gImJsdWV6NCBsaWJhdG9t
aWNzLW9wcyBsaWJvaWwgYXZhaGkgbGlic2FtcGxlcmF0ZTAgbGlic25kZmlsZTEgbGlidG9vbCBo
YWwgdmlydHVhbC9saWJ4MTEiCkRFUEVORFMgPSAiIGxpYmF0b21pY3Mtb3BzIGxpYm9pbCBsaWJz
YW1wbGVyYXRlMCBsaWJzbmRmaWxlMSBsaWJ0b29sIHZpcnR1YWwvbGlieDExICIKIyBvcHRpb25h
bAojREVQRU5EUyArPSAiYWxzYS1saWIgZ2xpYi0yLjAgZGJ1cyBjb25zb2xla2l0IGhhbCBvcGVu
c3NsIgpERVBFTkRTICs9ICJhbHNhLWxpYiBnbGliLTIuMCBkYnVzIG9wZW5zc2wiCklOQ19QUiA9
ICJyOSIKClNSQ19VUkkgPSAiaHR0cDovLzBwb2ludGVyLmRlL2xlbm5hcnQvcHJvamVjdHMvcHVs
c2VhdWRpby9wdWxzZWF1ZGlvLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgZmlsZTovL2djYzQt
Y29tcGlsZS1maXgucGF0Y2ggXAogICAgICAgICAgIGZpbGU6Ly92b2xhdGlsZXMuMDRfcHVsc2Ui
CiAgICAgICAgICAKCmluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwoKRVhUUkFfT0VDT05GID0g
IlwKCQktLWRpc2FibGUtbHlueCBcCgkJLS1kaXNhYmxlLWJsdWV6IFwKCQktLWRpc2FibGUtcG9s
a2l0IFwKCQktLXdpdGgteCBcCgkJLS13aXRob3V0LWphY2sgXAoJCS0td2l0aC1nbGliIFwKCQkt
LXdpdGgtYWxzYSBcCgkJLS13aXRoLW9zcyBcCgkJLS13aXRoLWhhbCBcCiIKClBBUkFMTEVMX01B
S0UgPSAiIgoKZXhwb3J0IFRBUkdFVF9QRlBVID0gIiR7VEFSR0VUX0ZQVX0iCgojIFRPRE86IFVz
ZSBtb3JlIGZpbmUgZ3JhbnVsYXIgdmVyc2lvbgojT0VfTFRfUlBBVEhfQUxMT1c9Ijoke2xpYmRp
cn0vcHVsc2UtMC45OiIKT0VfTFRfUlBBVEhfQUxMT1cgPSAiYW55IgpPRV9MVF9SUEFUSF9BTExP
V1tleHBvcnRdPSIxIgoKZG9fc3RhZ2UoKSB7CglhdXRvdG9vbHNfc3RhZ2VfYWxsCn0KCmRvX2lu
c3RhbGxfYXBwZW5kKCkgewoJaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfS9kZWZhdWx0L3Zv
bGF0aWxlcwoJaW5zdGFsbCAtbSAwNjQ0ICR7V09SS0RJUn0vdm9sYXRpbGVzLjA0X3B1bHNlICAk
e0R9JHtzeXNjb25mZGlyfS9kZWZhdWx0L3ZvbGF0aWxlcy8wNF9wdWxzZQoJCglpZiBbICJ4JHtU
QVJHRVRfUEZQVX0iID09ICJ4c29mdCIgXSA7IHRoZW4gCgkgICAgIHNlZCAtaSAtZSBzOlw7XCBy
ZXNhbXBsZS1tZXRob2RcID1cIHNpbmMtZmFzdGVzdDpyZXNhbXBsZS1tZXRob2RcID1cIHRyaXZp
YWw6ICR7RH0ke3N5c2NvbmZkaXJ9L3B1bHNlL2RhZW1vbi5jb25mCglmaQp9CgpQQUNLQUdFUyA9
KyAibGlicHVsc2Vjb3JlIGxpYnB1bHNlY29tbW9uIGxpYnB1bHNlZHNwIGxpYnB1bHNlIGxpYnB1
bHNlLXNpbXBsZSBsaWJwdWxzZS1icm93c2UgbGlicHVsc2UtbWFpbmxvb3AtZ2xpYiBcCiAgICAg
ICAgICAgICBwdWxzZWF1ZGlvLXNlcnZlciBwdWxzZWF1ZGlvLW1pc2MgcHVsc2VhdWRpby1nY29u
Zi1oZWxwZXIiCgojdXBncmFkZSBwYXRoOgpSUkVQTEFDRVNfcHVsc2VhdWRpby1zZXJ2ZXIgPSAi
bGlicHVsc2UtYmluIGxpYnB1bHNlLWNvbmYiCgpQQUNLQUdFU19EWU5BTUlDID0gInB1bHNlYXVk
aW8tbGliKiBwdWxzZWF1ZGlvLW1vZHVsZSogbGlicHVsc2UtbGliKiBsaWJwdWxzZS1tb2R1bGUq
ICIKCkZJTEVTX2xpYnB1bHNlY29yZSA9ICIke2xpYmRpcn0vbGlicHVsc2Vjb3JlKi5zbyIKRklM
RVNfbGlicHVsc2Vjb21tb24gPSAiJHtsaWJkaXJ9L2xpYnB1bHNlY29tbW9uKi5zbyIKRklMRVNf
bGlicHVsc2Vkc3AgPSAiJHtsaWJkaXJ9L2xpYnB1bHNlZHNwKi5zbyIKRklMRVNfbGlicHVsc2Ug
PSAiJHtsaWJkaXJ9L2xpYnB1bHNlLnNvLioiCkZJTEVTX2xpYnB1bHNlLXNpbXBsZSA9ICIke2xp
YmRpcn0vbGlicHVsc2Utc2ltcGxlLnNvLioiCkZJTEVTX2xpYnB1bHNlLWJyb3dzZSA9ICIke2xp
YmRpcn0vbGlicHVsc2UtYnJvd3NlLnNvLioiCkZJTEVTX2xpYnB1bHNlLW1haW5sb29wLWdsaWIg
PSAiJHtsaWJkaXJ9L2xpYnB1bHNlLW1haW5sb29wLWdsaWIuc28uKiIKCQkJCSAgIAkgCkZJTEVT
XyR7UE59LWRiZyArPSAiJHtsaWJleGVjZGlyfS9wdWxzZS8uZGVidWcgXAogICAgICAgICAgICAg
ICAgICAgICR7bGliZGlyfS9wdWxzZS0ke1BWfS9tb2R1bGVzLy5kZWJ1ZyIKRklMRVNfJHtQTn0t
ZGV2ICs9ICIke2xpYmRpcn0vcHVsc2UtJHtQVn0vbW9kdWxlcy8qLmxhIgkJICAgIApGSUxFU18k
e1BOfS1jb25mID0gIiR7c3lzY29uZmRpcn0iCkZJTEVTXyR7UE59LWJpbiA9ICIke2JpbmRpcn0v
KiBcCiAgICAgICAgICAgICAgICAgICAke3N5c2NvbmZkaXJ9L2RlZmF1bHQvdm9sYXRpbGVzL3Zv
bGF0aWxlcy4wNF9wdWxzZSIKRklMRVNfJHtQTn0tc2VydmVyID0gIiR7YmluZGlyfS9wdWxzZWF1
ZGlvICR7YmluZGlyfS9zdGFydC0qICR7c3lzY29uZmRpcn0gJHtiaW5kaXJ9L3BhY3RsIgpGSUxF
U18ke1BOfS1nY29uZi1oZWxwZXIgPSAiJHtsaWJleGVjZGlyfS9wdWxzZS9nY29uZi1oZWxwZXIi
CkZJTEVTXyR7UE59LW1pc2MgPSAiJHtiaW5kaXJ9LyoiCgojIEFsbG93IHRoZSBwdWxzZWF1ZGlv
IHBhY2thZ2UgdG8gYmUgY3JlYXRlZCBlbXB0eSBhcyBhIHBsYWNlaG9sZGVyICgtZGJnIGFuZCAt
ZGV2IGRlcGVuZCBvbiBpdCkKQUxMT1dfRU1QVFlfJHtQTn0gPSAiMSIKCkNPTkZGSUxFU19wdWxz
ZWF1ZGlvLXNlcnZlciA9ICJcIAogICR7c3lzY29uZmRpcn0vcHVsc2UvZGVmYXVsdC5wYSBcCiAg
JHtzeXNjb25mZGlyfS9wdWxzZS9kYWVtb24uY29uZiBcCiAgJHtzeXNjb25mZGlyfS9wdWxzZS9j
bGllbnQuY29uZiBcCiAgIgoKcGtnX3Bvc3RpbnN0XyR7UE59LXNlcnZlcigpIHsKICAgICAgICAj
IGNhbid0IGRvIHRoaXMgb2ZmbGluZQogICAgICAgIGlmIFsgIngkRCIgIT0gIngiIF07IHRoZW4K
ICAgICAgICAgICAgICAgIGV4aXQgMQogICAgICAgIGZpCiAgICAgICAgZ3JlcCAtcSBwdWxzZTog
L2V0Yy9ncm91cCB8fCBhZGRncm91cCBwdWxzZQogICAgICAgIGdyZXAgLXEgcHVsc2U6IC9ldGMv
cGFzc3dkIHx8IFwKICAgICAgICAgICAgYWRkdXNlciAtLWRpc2FibGVkLXBhc3N3b3JkIC0taG9t
ZT0vdmFyL3J1bi9wdWxzZSAtLXN5c3RlbSBcCiAgICAgICAgICAgICAgICAgICAgLS1pbmdyb3Vw
IHB1bHNlIC0tbm8tY3JlYXRlLWhvbWUgLWcgIlB1bHNlIGF1ZGlvIGRhZW1vbiIgcHVsc2UKICAg
ICAgICBhZGRncm91cCBwdWxzZSBhdWRpbwogICAgICAgIC9ldGMvaW5pdC5kL3BvcHVsYXRlLXZv
bGF0aWxlLnNoIHVwZGF0ZQp9Cgpwa2dfcG9zdHJtXyR7UE59LXNlcnZlcigpIHsKICAgICAgICBk
ZWx1c2VyIHB1bHNlIHx8IHRydWUKfQoKcHl0aG9uIHBvcHVsYXRlX3BhY2thZ2VzX3ByZXBlbmQo
KSB7CiAgICAgICAgI2JiLmRhdGEuc2V0VmFyKCdQS0dfcHVsc2VhdWRpbycsICdwdWxzZWF1ZGlv
JywgZCkKCiAgICAgICAgcGx1Z2luZGlyID0gYmIuZGF0YS5leHBhbmQoJyR7bGliZGlyfS9wdWxz
ZS0ke1BWfS9tb2R1bGVzLycsIGQpCiAgICAgICAgZG9fc3BsaXRfcGFja2FnZXMoZCwgcGx1Z2lu
ZGlyLCAnXm1vZHVsZS0oLiopXC5zbyQnLCAncHVsc2VhdWRpby1tb2R1bGUtJXMnLCAnUHVsc2VB
dWRpbyBtb2R1bGUgZm9yICVzJywgZXh0cmFfZGVwZW5kcz0nJyApCiAgICAgICAgZG9fc3BsaXRf
cGFja2FnZXMoZCwgcGx1Z2luZGlyLCAnXmxpYiguKilcLnNvJCcsICdwdWxzZWF1ZGlvLWxpYi0l
cycsICdQdWxzZUF1ZGlvIGxpYnJhcnkgZm9yICVzJywgZXh0cmFfZGVwZW5kcz0nJyApCn0KCiNS
REVQRU5EU19wdWxzZWF1ZGlvLW1vZHVsZS1jb25zb2xlLWtpdCA9KyAiY29uc29sZWtpdCIKUkRF
UEVORFNfcHVsc2VhdWRpby1tb2R1bGUtaGFsX2RldGVjdCA9KyAiaGFsIgpSREVQRU5EU19wdWxz
ZWF1ZGlvLXNlcnZlciA9ICIgXAogICAgcHVsc2VhdWRpby1tb2R1bGUtZGV2aWNlLXJlc3RvcmUg
XAogICAgcHVsc2VhdWRpby1tb2R1bGUtc3RyZWFtLXJlc3RvcmUgXAogICAgcHVsc2VhdWRpby1t
b2R1bGUtY2FyZC1yZXN0b3JlIFwKICAgIHB1bHNlYXVkaW8tbW9kdWxlLWF1Z21lbnQtcHJvcGVy
dGllcyBcCiAgICBwdWxzZWF1ZGlvLW1vZHVsZS1kZXRlY3QgXAogICAgcHVsc2VhdWRpby1tb2R1
bGUtYWxzYS1zaW5rIFwKICAgIHB1bHNlYXVkaW8tbW9kdWxlLWFsc2Etc291cmNlIFwKICAgIHB1
bHNlYXVkaW8tbW9kdWxlLWFsc2EtY2FyZCBcCiAgICBwdWxzZWF1ZGlvLW1vZHVsZS1uYXRpdmUt
cHJvdG9jb2wtdW5peCBcCiAgICBwdWxzZWF1ZGlvLW1vZHVsZS1oYWwtZGV0ZWN0IFwKICAgIHB1
bHNlYXVkaW8tbW9kdWxlLWRlZmF1bHQtZGV2aWNlLXJlc3RvcmUgXAogICAgcHVsc2VhdWRpby1t
b2R1bGUtcmVzY3VlLXN0cmVhbXMgXAogICAgcHVsc2VhdWRpby1tb2R1bGUtYWx3YXlzLXNpbmsg
XAogICAgcHVsc2VhdWRpby1tb2R1bGUtc3VzcGVuZC1vbi1pZGxlIFwKICAgIHB1bHNlYXVkaW8t
bW9kdWxlLWNvbnNvbGUta2l0IFwKICAgIHB1bHNlYXVkaW8tbW9kdWxlLXBvc2l0aW9uLWV2ZW50
LXNvdW5kcyBcCiAgICBwdWxzZWF1ZGlvLW1vZHVsZS1jb3JrLW11c2ljLW9uLXBob25lICIKCg==

--_002_76E258664B189C4CBEF125491CA11ECC945B662B53KCINPUNHJCMS0_--
