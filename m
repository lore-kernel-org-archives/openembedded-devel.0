Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N5vW2-0002TN-7W
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 07:08:17 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N5vUT-0001Yw-R7 for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 01:06:38 -0500
Date: Thu, 5 Nov 2009 01:06:14 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911050101490.17537@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE breakage: qte-mt_2.3.10.bb.
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
X-List-Received-Date: Thu, 05 Nov 2009 06:08:17 -0000
X-Groupsio-MsgNum: 13874
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1594650128-1257401197=:17537"

--8323328-1594650128-1257401197=:17537
Content-Type: TEXT/PLAIN; charset=US-ASCII


  yes, it's just me again, whining about another build error.
bitbaking qte-mt produces:

NOTE: Running task 747 of 759 (ID: 8,
/home/rpjday/oe/openembedded/recipes/qte/qte-mt_2.3.10.bb, do_compile)
ERROR: function do_compile failed
ERROR: see log in /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/qte-mt-2.3.10-r28/temp/log.do_compile.26359
NOTE: Task failed: /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/qte-mt-2.3.10-r28/temp/log.do_compile.26359
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/rpjday/oe/openembedded/recipes/qte/qte-mt_2.3.10.bb do_compile failed
ERROR: Task 8 (/home/rpjday/oe/openembedded/recipes/qte/qte-mt_2.3.10.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 747 tasks of which 747 didn't need to be rerun and 1 failed.
ERROR: '/home/rpjday/oe/openembedded/recipes/qte/qte-mt_2.3.10.bb' failed

  qte-mt log file attached, but here's what appears to be the salient
bit:

...
kernel/qpixmapcache.cpp:125:57: error: asm/page.h: No such file or directory
...

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================

--8323328-1594650128-1257401197=:17537
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=log.do_compile.26359
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LFD.2.00.0911050106140.17537@localhost>
Content-Description: 
Content-Disposition: attachment; filename=log.do_compile.26359

Tk9URTogbWFrZSAtajQgLWUgc3ltbGlua3MNCk5PVEU6IG1ha2UgLWo0IC1lIHNyYy1tdCBzdWIt
c3JjDQptYWtlIC1mIHNyYy1tdC5taw0KbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvaG9t
ZS9ycGpkYXkvb2UvYW5nc3Ryb20tZGV2L3dvcmsvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVh
YmkvcXRlLW10LTIuMy4xMC1yMjgvcXQtMi4zLjEwJw0KY2Qgc3JjOyBtYWtlIAkgICAgJ1FUX1RI
UkVBRF9TVUZGSVg9LW10JyAJICAgICdRVF9MRkxBR1NfTVQ9JChTWVNDT05GX0xGTEFHU19USFJF
QUQpICQoU1lTQ09ORl9MSUJTX1RIUkVBRCknIAkgICAgJ1FUX0NYWF9NVD0kKFNZU0NPTkZfQ1hY
RkxBR1NfVEhSRUFEKSAtRFFUX1RIUkVBRF9TVVBQT1JUJyAJICAgICdRVF9DX01UPSQoU1lTQ09O
Rl9DRkxBR1NfVEhSRUFEKSAtRFFUX1RIUkVBRF9TVVBQT1JUJw0KbWFrZVsyXTogRW50ZXJpbmcg
ZGlyZWN0b3J5IGAvaG9tZS9ycGpkYXkvb2UvYW5nc3Ryb20tZGV2L3dvcmsvYXJtdjdhLWFuZ3N0
cm9tLWxpbnV4LWdudWVhYmkvcXRlLW10LTIuMy4xMC1yMjgvcXQtMi4zLjEwL3NyYycNCmNjYWNo
ZSBhcm0tYW5nc3Ryb20tbGludXgtZ251ZWFiaS1nKysgLW1hcmNoPWFybXY3LWEgLW10dW5lPWNv
cnRleC1hOCAtbWZwdT1uZW9uIC1tZmxvYXQtYWJpPXNvZnRmcCAtRF9SRUVOVFJBTlQgLURRVF9U
SFJFQURfU1VQUE9SVCAtYyAtSS9ob21lL3JwamRheS9vZS9hbmdzdHJvbS1kZXYvd29yay9hcm12
N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9xdGUtbXQtMi4zLjEwLXIyOC9xdC0yLjMuMTAvaW5j
bHVkZSAgLWlzeXN0ZW0vaG9tZS9ycGpkYXkvb2UvYW5nc3Ryb20tZGV2L3N0YWdpbmcvYXJtdjdh
LWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2luY2x1ZGUgLWZleHBlbnNpdmUtb3B0aW1pemF0
aW9ucyAtZnJlbmFtZS1yZWdpc3RlcnMgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLU9zIC1nZ2RiMyAt
ZnBlcm1pc3NpdmUgLXBpcGUgLURRV1MgLWZuby1leGNlcHRpb25zIC1mcnR0aSAtRE5PX0RFQlVH
IC1EUVRfUVdTX1RTTElCIC1EUVRfUVdTX0NVU1RPTSAtRFFUX1FXU19JUEFRIC1EVVNFX0JJREkg
LWZQSUMgLURRVF9OT19JTUFHRUlPX01ORyAtRFFUX05PX1ZOQyAtRFFUX05PX1FXU19TTkFQIC1E
UVRfTk9fUVdTX1ZPT0RPTzMgLURRVF9OT19RV1NfTUFDSDY0IC1EUVRfTk9fUVdTX01BVFJPWCAt
RFFUX05PX1FXU19WTkMgLURRVF9OT19RV1NfVkdBXzE2IC1EUVRfTk9fUVdTX0RFUFRIXzQgLURR
VF9OT19RV1NfREVQVEhfMjQgLURRVF9OT19RV1NfVkZCIC1EUVRfQlVJTFRJTl9HSUZfUkVBREVS
PTEgLURRVF9OT19JTUFHRUlPX01ORyAtRFFUX05PX1NNX1NVUFBPUlQgLURRVF9OT19YS0IgICAt
STNyZHBhcnR5L2tlcm5lbCAtSTNyZHBhcnR5L3Rvb2xzIC1vIGtlcm5lbC9xcGl4bWFwY2FjaGUu
byBrZXJuZWwvcXBpeG1hcGNhY2hlLmNwcA0KY2NhY2hlIGFybS1hbmdzdHJvbS1saW51eC1nbnVl
YWJpLWcrKyAtbWFyY2g9YXJtdjctYSAtbXR1bmU9Y29ydGV4LWE4IC1tZnB1PW5lb24gLW1mbG9h
dC1hYmk9c29mdGZwIC1EX1JFRU5UUkFOVCAtRFFUX1RIUkVBRF9TVVBQT1JUIC1jIC1JL2hvbWUv
cnBqZGF5L29lL2FuZ3N0cm9tLWRldi93b3JrL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJp
L3F0ZS1tdC0yLjMuMTAtcjI4L3F0LTIuMy4xMC9pbmNsdWRlICAtaXN5c3RlbS9ob21lL3JwamRh
eS9vZS9hbmdzdHJvbS1kZXYvc3RhZ2luZy9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91
c3IvaW5jbHVkZSAtZmV4cGVuc2l2ZS1vcHRpbWl6YXRpb25zIC1mcmVuYW1lLXJlZ2lzdGVycyAt
Zm9taXQtZnJhbWUtcG9pbnRlciAtT3MgLWdnZGIzIC1mcGVybWlzc2l2ZSAtcGlwZSAtRFFXUyAt
Zm5vLWV4Y2VwdGlvbnMgLWZydHRpIC1ETk9fREVCVUcgLURRVF9RV1NfVFNMSUIgLURRVF9RV1Nf
Q1VTVE9NIC1EUVRfUVdTX0lQQVEgLURVU0VfQklESSAtZlBJQyAtRFFUX05PX0lNQUdFSU9fTU5H
IC1EUVRfTk9fVk5DIC1EUVRfTk9fUVdTX1NOQVAgLURRVF9OT19RV1NfVk9PRE9PMyAtRFFUX05P
X1FXU19NQUNINjQgLURRVF9OT19RV1NfTUFUUk9YIC1EUVRfTk9fUVdTX1ZOQyAtRFFUX05PX1FX
U19WR0FfMTYgLURRVF9OT19RV1NfREVQVEhfNCAtRFFUX05PX1FXU19ERVBUSF8yNCAtRFFUX05P
X1FXU19WRkIgLURRVF9CVUlMVElOX0dJRl9SRUFERVI9MSAtRFFUX05PX0lNQUdFSU9fTU5HIC1E
UVRfTk9fU01fU1VQUE9SVCAtRFFUX05PX1hLQiAgIC1JM3JkcGFydHkva2VybmVsIC1JM3JkcGFy
dHkvdG9vbHMgLW8gd2lkZ2V0cy9xbGNkbnVtYmVyLm8gd2lkZ2V0cy9xbGNkbnVtYmVyLmNwcA0K
Y2NhY2hlIGFybS1hbmdzdHJvbS1saW51eC1nbnVlYWJpLWcrKyAtbWFyY2g9YXJtdjctYSAtbXR1
bmU9Y29ydGV4LWE4IC1tZnB1PW5lb24gLW1mbG9hdC1hYmk9c29mdGZwIC1EX1JFRU5UUkFOVCAt
RFFUX1RIUkVBRF9TVVBQT1JUIC1jIC1JL2hvbWUvcnBqZGF5L29lL2FuZ3N0cm9tLWRldi93b3Jr
L2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3F0ZS1tdC0yLjMuMTAtcjI4L3F0LTIuMy4x
MC9pbmNsdWRlICAtaXN5c3RlbS9ob21lL3JwamRheS9vZS9hbmdzdHJvbS1kZXYvc3RhZ2luZy9h
cm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVkZSAtZmV4cGVuc2l2ZS1vcHRp
bWl6YXRpb25zIC1mcmVuYW1lLXJlZ2lzdGVycyAtZm9taXQtZnJhbWUtcG9pbnRlciAtT3MgLWdn
ZGIzIC1mcGVybWlzc2l2ZSAtcGlwZSAtRFFXUyAtZm5vLWV4Y2VwdGlvbnMgLWZydHRpIC1ETk9f
REVCVUcgLURRVF9RV1NfVFNMSUIgLURRVF9RV1NfQ1VTVE9NIC1EUVRfUVdTX0lQQVEgLURVU0Vf
QklESSAtZlBJQyAtRFFUX05PX0lNQUdFSU9fTU5HIC1EUVRfTk9fVk5DIC1EUVRfTk9fUVdTX1NO
QVAgLURRVF9OT19RV1NfVk9PRE9PMyAtRFFUX05PX1FXU19NQUNINjQgLURRVF9OT19RV1NfTUFU
Uk9YIC1EUVRfTk9fUVdTX1ZOQyAtRFFUX05PX1FXU19WR0FfMTYgLURRVF9OT19RV1NfREVQVEhf
NCAtRFFUX05PX1FXU19ERVBUSF8yNCAtRFFUX05PX1FXU19WRkIgLURRVF9CVUlMVElOX0dJRl9S
RUFERVI9MSAtRFFUX05PX0lNQUdFSU9fTU5HIC1EUVRfTk9fU01fU1VQUE9SVCAtRFFUX05PX1hL
QiAgIC1JM3JkcGFydHkva2VybmVsIC1JM3JkcGFydHkvdG9vbHMgLW8gd2lkZ2V0cy9xbGluZWVk
aXQubyB3aWRnZXRzL3FsaW5lZWRpdC5jcHANCmNjYWNoZSBhcm0tYW5nc3Ryb20tbGludXgtZ251
ZWFiaS1nKysgLW1hcmNoPWFybXY3LWEgLW10dW5lPWNvcnRleC1hOCAtbWZwdT1uZW9uIC1tZmxv
YXQtYWJpPXNvZnRmcCAtRF9SRUVOVFJBTlQgLURRVF9USFJFQURfU1VQUE9SVCAtYyAtSS9ob21l
L3JwamRheS9vZS9hbmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFi
aS9xdGUtbXQtMi4zLjEwLXIyOC9xdC0yLjMuMTAvaW5jbHVkZSAgLWlzeXN0ZW0vaG9tZS9ycGpk
YXkvb2UvYW5nc3Ryb20tZGV2L3N0YWdpbmcvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkv
dXNyL2luY2x1ZGUgLWZleHBlbnNpdmUtb3B0aW1pemF0aW9ucyAtZnJlbmFtZS1yZWdpc3RlcnMg
LWZvbWl0LWZyYW1lLXBvaW50ZXIgLU9zIC1nZ2RiMyAtZnBlcm1pc3NpdmUgLXBpcGUgLURRV1Mg
LWZuby1leGNlcHRpb25zIC1mcnR0aSAtRE5PX0RFQlVHIC1EUVRfUVdTX1RTTElCIC1EUVRfUVdT
X0NVU1RPTSAtRFFUX1FXU19JUEFRIC1EVVNFX0JJREkgLWZQSUMgLURRVF9OT19JTUFHRUlPX01O
RyAtRFFUX05PX1ZOQyAtRFFUX05PX1FXU19TTkFQIC1EUVRfTk9fUVdTX1ZPT0RPTzMgLURRVF9O
T19RV1NfTUFDSDY0IC1EUVRfTk9fUVdTX01BVFJPWCAtRFFUX05PX1FXU19WTkMgLURRVF9OT19R
V1NfVkdBXzE2IC1EUVRfTk9fUVdTX0RFUFRIXzQgLURRVF9OT19RV1NfREVQVEhfMjQgLURRVF9O
T19RV1NfVkZCIC1EUVRfQlVJTFRJTl9HSUZfUkVBREVSPTEgLURRVF9OT19JTUFHRUlPX01ORyAt
RFFUX05PX1NNX1NVUFBPUlQgLURRVF9OT19YS0IgICAtSTNyZHBhcnR5L2tlcm5lbCAtSTNyZHBh
cnR5L3Rvb2xzIC1vIHdpZGdldHMvcWxpc3Rib3gubyB3aWRnZXRzL3FsaXN0Ym94LmNwcA0Ka2Vy
bmVsL3FwaXhtYXBjYWNoZS5jcHA6MTI1OjU3OiBlcnJvcjogYXNtL3BhZ2UuaDogTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeQ0KY2NhY2hlIGFybS1hbmdzdHJvbS1saW51eC1nbnVlYWJpLWcrKyAt
bWFyY2g9YXJtdjctYSAtbXR1bmU9Y29ydGV4LWE4IC1tZnB1PW5lb24gLW1mbG9hdC1hYmk9c29m
dGZwIC1EX1JFRU5UUkFOVCAtRFFUX1RIUkVBRF9TVVBQT1JUIC1jIC1JL2hvbWUvcnBqZGF5L29l
L2FuZ3N0cm9tLWRldi93b3JrL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3F0ZS1tdC0y
LjMuMTAtcjI4L3F0LTIuMy4xMC9pbmNsdWRlICAtaXN5c3RlbS9ob21lL3JwamRheS9vZS9hbmdz
dHJvbS1kZXYvc3RhZ2luZy9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVk
ZSAtZmV4cGVuc2l2ZS1vcHRpbWl6YXRpb25zIC1mcmVuYW1lLXJlZ2lzdGVycyAtZm9taXQtZnJh
bWUtcG9pbnRlciAtT3MgLWdnZGIzIC1mcGVybWlzc2l2ZSAtcGlwZSAtRFFXUyAtZm5vLWV4Y2Vw
dGlvbnMgLWZydHRpIC1ETk9fREVCVUcgLURRVF9RV1NfVFNMSUIgLURRVF9RV1NfQ1VTVE9NIC1E
UVRfUVdTX0lQQVEgLURVU0VfQklESSAtZlBJQyAtRFFUX05PX0lNQUdFSU9fTU5HIC1EUVRfTk9f
Vk5DIC1EUVRfTk9fUVdTX1NOQVAgLURRVF9OT19RV1NfVk9PRE9PMyAtRFFUX05PX1FXU19NQUNI
NjQgLURRVF9OT19RV1NfTUFUUk9YIC1EUVRfTk9fUVdTX1ZOQyAtRFFUX05PX1FXU19WR0FfMTYg
LURRVF9OT19RV1NfREVQVEhfNCAtRFFUX05PX1FXU19ERVBUSF8yNCAtRFFUX05PX1FXU19WRkIg
LURRVF9CVUlMVElOX0dJRl9SRUFERVI9MSAtRFFUX05PX0lNQUdFSU9fTU5HIC1EUVRfTk9fU01f
U1VQUE9SVCAtRFFUX05PX1hLQiAgIC1JM3JkcGFydHkva2VybmVsIC1JM3JkcGFydHkvdG9vbHMg
LW8gd2lkZ2V0cy9xbGlzdHZpZXcubyB3aWRnZXRzL3FsaXN0dmlldy5jcHANCm1ha2VbMl06ICoq
KiBba2VybmVsL3FwaXhtYXBjYWNoZS5vXSBFcnJvciAxDQptYWtlWzJdOiAqKiogV2FpdGluZyBm
b3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgYC9ob21l
L3JwamRheS9vZS9hbmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFi
aS9xdGUtbXQtMi4zLjEwLXIyOC9xdC0yLjMuMTAvc3JjJw0KbWFrZVsxXTogKioqIFtzcmMtbXRd
IEVycm9yIDINCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAvaG9tZS9ycGpkYXkvb2UvYW5n
c3Ryb20tZGV2L3dvcmsvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvcXRlLW10LTIuMy4x
MC1yMjgvcXQtMi4zLjEwJw0KbWFrZTogKioqIFtzcmMtbXRdIEVycm9yIDINCkZBVEFMOiBvZV9y
dW5tYWtlIGZhaWxlZA0K

--8323328-1594650128-1257401197=:17537--
