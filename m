Received: from [66.249.82.231] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philipp.zabel@gmail.com>) id 1HDQYr-0001wT-5y
	for openembedded-devel@openembedded.org; Sat, 03 Feb 2007 20:28:33 +0100
Received: by wx-out-0506.google.com with SMTP id t13so1084663wxc
	for <openembedded-devel@openembedded.org>;
	Sat, 03 Feb 2007 11:28:32 -0800 (PST)
Received: by 10.90.68.15 with SMTP id q15mr6888512aga.1170530912257;
	Sat, 03 Feb 2007 11:28:32 -0800 (PST)
Received: by 10.90.92.2 with HTTP; Sat, 3 Feb 2007 11:28:32 -0800 (PST)
Message-ID: <74d0deb30702031128n7c1fd617j880efc181d71a59@mail.gmail.com>
Date: Sat, 3 Feb 2007 20:28:32 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] Epoch support for bitbake (and OE)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Feb 2007 19:28:33 -0000
X-Groupsio-MsgNum: 1322
Content-Type: multipart/mixed; 
	boundary="----=_Part_29047_502117.1170530912177"

------=_Part_29047_502117.1170530912177
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I have attached three patches needed to test epoch support with OE.

bb-epoch-extend-pf.patch
changes the PF variable (currently "${PN}-${PV}-${PR}") to
"${PN}-${PE}_${PV}-${PR}" if an epoch > 0 is set. This variable
is used by STAMPS, WORKDIR and FILESDIR for example.

bb-epoch-package-ipk.patch
adds support to set the epoch in the Version field of ipk packages.
package_deb.bbclass can be changed similarly.
How does this work for rpm packages, and what to do
with package_tar.bbclass (just ignore PE)?

bb-epoch-libx11-example.patch
Ok, maybe this one is a bit superfluous. This is libx11_1.0.1 with
PE="1" set and can be used to test drive above patches.

regards
Philipp

------=_Part_29047_502117.1170530912177
Content-Type: text/x-patch; name=bb-epoch-extend-pf.patch; 
	charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_exqfnkuu
Content-Disposition: attachment; filename="bb-epoch-extend-pf.patch"

IyAKIyBvbGRfcmV2aXNpb24gWzFmYzlhODM1NmU5YTBhYTllNjQ0ZTNjZTdmODc1MmUwNzQ4YTZj
MWJdCiMgCiMgcGF0Y2ggImNvbmYvYml0YmFrZS5jb25mIgojICBmcm9tIFsyNDUyM2YxNjBjM2Yw
YWQ2YTg5NzJhZDY4NzkyZDNlZTllNzIyM2YxXQojICAgIHRvIFs3MGFkOTU1YzNhODUwYWU5NzEy
OTExMDIyN2RlNmY1MGE4ODZhY2M4XQojIAo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGNvbmYvYml0YmFrZS5jb25mCTI0NTIz
ZjE2MGMzZjBhZDZhODk3MmFkNjg3OTJkM2VlOWU3MjIzZjEKKysrIGNvbmYvYml0YmFrZS5jb25m
CTcwYWQ5NTVjM2E4NTBhZTk3MTI5MTEwMjI3ZGU2ZjUwYTg4NmFjYzgKQEAgLTgyLDcgKzgyLDgg
QEAgUFIgPSAiJHtAYmIucGFyc2UuQkJIYW5kbGVyLnZhcnNfZnJvbV9maQogUE4gPSAiJHtAYmIu
cGFyc2UuQkJIYW5kbGVyLnZhcnNfZnJvbV9maWxlKGJiLmRhdGEuZ2V0VmFyKCdGSUxFJyxkKSxk
KVswXSBvciAnZGVmYXVsdHBrZ25hbWUnfSIKIFBWID0gIiR7QGJiLnBhcnNlLkJCSGFuZGxlci52
YXJzX2Zyb21fZmlsZShiYi5kYXRhLmdldFZhcignRklMRScsZCksZClbMV0gb3IgJzEuMCd9Igog
UFIgPSAiJHtAYmIucGFyc2UuQkJIYW5kbGVyLnZhcnNfZnJvbV9maWxlKGJiLmRhdGEuZ2V0VmFy
KCdGSUxFJyxkKSxkKVsyXSBvciAncjAnfSIKLVBGID0gIiR7UE59LSR7UFZ9LSR7UFJ9IgorUEYg
PSAiJHtQTn0tJHtFWFRFTkRQRX0ke1BWfS0ke1BSfSIKK0VYVEVORFBFID0gIiR7QFsnJywnJHtQ
RVx4N2RfJ11bYmIuZGF0YS5nZXRWYXIoJ1BFJyxkLDEpID4gMF19IgogUCA9ICIke1BOfS0ke1BW
fSIKIAogIyBQYWNrYWdlIGluZm8uCg==

------=_Part_29047_502117.1170530912177
Content-Type: text/x-patch; name=bb-epoch-package-ipk.patch; 
	charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_exqfo1hv
Content-Disposition: attachment; filename="bb-epoch-package-ipk.patch"

IyAKIyBvbGRfcmV2aXNpb24gWzFmYzlhODM1NmU5YTBhYTllNjQ0ZTNjZTdmODc1MmUwNzQ4YTZj
MWJdCiMgCiMgcGF0Y2ggImNsYXNzZXMvcGFja2FnZV9pcGsuYmJjbGFzcyIKIyAgZnJvbSBbNmY1
ZDQ0ZmI3Y2YwNjVjZTdiNjgwMDA5ZTVjOWJjYjU1NGY3NjBjNF0KIyAgICB0byBbNTc0YjM3ZjQ0
ZDFiMTdiYWRiZWJjNTY3Y2MwOTQ0ODNlMzYyNjhiY10KIyAKPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSBjbGFzc2VzL3BhY2th
Z2VfaXBrLmJiY2xhc3MJNmY1ZDQ0ZmI3Y2YwNjVjZTdiNjgwMDA5ZTVjOWJjYjU1NGY3NjBjNAor
KysgY2xhc3Nlcy9wYWNrYWdlX2lway5iYmNsYXNzCTU3NGIzN2Y0NGQxYjE3YmFkYmViYzU2N2Nj
MDk0NDgzZTM2MjY4YmMKQEAgLTEzOSw3ICsxMzksMTEgQEAgcHl0aG9uIGRvX3BhY2thZ2VfaXBr
ICgpIHsKIAkJCXJhaXNlIGJiLmJ1aWxkLkZ1bmNGYWlsZWQoInVuYWJsZSB0byBvcGVuIGNvbnRy
b2wgZmlsZSBmb3Igd3JpdGluZy4iKQogCiAJCWZpZWxkcyA9IFtdCi0JCWZpZWxkcy5hcHBlbmQo
WyJWZXJzaW9uOiAlcy0lc1xuIiwgWydQVicsICdQUiddXSkKKwkJcGUgPSBiYi5kYXRhLmdldFZh
cignUEUnLCBkLCAxKQorCQlpZiBwZSBhbmQgaW50KHBlKSA+IDA6CisJCQlmaWVsZHMuYXBwZW5k
KFsiVmVyc2lvbjogJXM6JXMtJXNcbiIsIFsnUEUnLCAnUFYnLCAnUFInXV0pCisJCWVsc2U6CisJ
CQlmaWVsZHMuYXBwZW5kKFsiVmVyc2lvbjogJXMtJXNcbiIsIFsnUFYnLCAnUFInXV0pCiAJCWZp
ZWxkcy5hcHBlbmQoWyJEZXNjcmlwdGlvbjogJXNcbiIsIFsnREVTQ1JJUFRJT04nXV0pCiAJCWZp
ZWxkcy5hcHBlbmQoWyJTZWN0aW9uOiAlc1xuIiwgWydTRUNUSU9OJ11dKQogCQlmaWVsZHMuYXBw
ZW5kKFsiUHJpb3JpdHk6ICVzXG4iLCBbJ1BSSU9SSVRZJ11dKQo=

------=_Part_29047_502117.1170530912177
Content-Type: text/x-patch; name=bb-epoch-libx11-example.patch; 
	charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_exqfo8g2
Content-Disposition: attachment; filename="bb-epoch-libx11-example.patch"

IyAKIyBvbGRfcmV2aXNpb24gWzFmYzlhODM1NmU5YTBhYTllNjQ0ZTNjZTdmODc1MmUwNzQ4YTZj
MWJdCiMgCiMgYWRkX2ZpbGUgInBhY2thZ2VzL3hvcmctbGliL2xpYngxMV8xLjAuMS5iYiIKIyAg
Y29udGVudCBbYjE5NDlkZGE1NmI5NDI4OGUyN2RjZTEzOWVlOWVmYzlmMmQ5MzI5MF0KIyAKPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Ci0tLSBwYWNrYWdlcy94b3JnLWxpYi9saWJ4MTFfMS4wLjEuYmIJYjE5NDlkZGE1NmI5NDI4OGUy
N2RjZTEzOWVlOWVmYzlmMmQ5MzI5MAorKysgcGFja2FnZXMveG9yZy1saWIvbGlieDExXzEuMC4x
LmJiCWIxOTQ5ZGRhNTZiOTQyODhlMjdkY2UxMzllZTllZmM5ZjJkOTMyOTAKQEAgLTAsMCArMSwy
NiBAQAorcmVxdWlyZSB4b3JnLWxpYi1jb21tb24uaW5jCisKK1BFID0gIjEiCitQUiA9ICJyMSIK
KworREVTQ1JJUFRJT04gPSAiQmFzZSBYIGxpYnMuIgorCitERVBFTkRTICs9ICIgYmlncmVxc3By
b3RvIHhwcm90byB4ZXh0cHJvdG8geHRyYW5zIGxpYnhhdSB4Y21pc2Nwcm90byBcCisJbGlieGRt
Y3AgeGY4NmJpZ2ZvbnRwcm90byBrYnByb3RvIGlucHV0cHJvdG8iCitQUk9WSURFUyA9ICJ2aXJ0
dWFsL2xpYngxMSIKK1JQUk9WSURFUyA9ICJ2aXJ0dWFsL2xpYngxMSIKKworWE9SR19QTiA9ICJs
aWJYMTEiCitTUkNfVVJJID0gIiR7WE9SR19NSVJST1J9L2luZGl2aWR1YWwvbGliLyR7WE9SR19Q
Tn0tJHtQVn0udGFyLmJ6MiIKKworRklMRVNfJHtQTn0gKz0gIiR7ZGF0YWRpcn0vWDExL1hLZXlz
eW1EQiAke2RhdGFkaXJ9L1gxMS9YRXJyb3JEQiAke2xpYmRpcn0vWDExL1hjbXMudHh0IgorRklM
RVNfJHtQTn0tbG9jYWxlICs9ICIke2RhdGFkaXJ9L1gxMS9sb2NhbGUgJHtsaWJkaXJ9L1gxMS9s
b2NhbGUiCisKK2RvX2NvbXBpbGUoKSB7CisJKAorCSB1bnNldCBDQyBMRCBDWFggQ0NMRCBDRkxB
R1MgQ1BQRkxBR1MgTERGTEFHUyBDWFhGTEFHUworCSBjZCBzcmMvdXRpbDsgdG91Y2ggbWFrZWtl
eXMtbWFrZWtleXMubyA7ICR7QlVJTERfQ0N9ICR7QlVJTERfQ0ZMQUdTfSBtYWtla2V5cy5jIC1v
IG1ha2VrZXlzCisJKSB8fCBleGl0IDEKKwkJcm0gLWYgJHtTVEFHSU5HX0lOQ0RJUn0vWDExL1hs
aWIuaAorCW9lX3J1bm1ha2UKK30K

------=_Part_29047_502117.1170530912177--
