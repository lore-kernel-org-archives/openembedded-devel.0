Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L3VPW-0004bx-67
	for openembedded-devel@openembedded.org; Fri, 21 Nov 2008 13:46:58 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L3VMz-0007E9-3N
	for openembedded-devel@openembedded.org; Fri, 21 Nov 2008 12:44:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 21 Nov 2008 12:44:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 21 Nov 2008 12:44:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 21 Nov 2008 13:44:11 +0100
Message-ID: <gg6aes$5vf$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081116 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: Revert "busybox: Disable busybox shadow support for Angstrom"
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
X-List-Received-Date: Fri, 21 Nov 2008 12:46:58 -0000
X-Groupsio-MsgNum: 6694
Content-Type: multipart/mixed; boundary="------------030704040207060800070102"

--------------030704040207060800070102
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Graeme and I reverted "busybox: Disable busybox shadow support for 
Angstrom", the commit message explains it:

"Revert "busybox: Disable busybox shadow support for Angstrom"
* Do NOT, I repeat NOT touch such core distro files without approval of 
distro maintainters
* This is the wrong solution to the problem, please raise a discussion 
on email list!

Signed-off-by: Koen Kooi <koen@openembedded.org>
Signed-off-by: Graeme 'XorA' Gregory <<dp@xora.org.uk>

This reverts commit 4339d706baf166732d6b7d3b2bedb0c54ce76cbf."

I looked at the instructions new commiters get sent, and it says:

"1) Everything outside org.openembedded.dev/packages/ should be treated 
with extreme care. Please communicate with other developers first if you 
want to touch that area. If you are a distro maintainer you are of 
course free to touch your distro config files without asking. If you are 
a machine maintainer, please communicate first, since it's easy to get 
things wrong and not all machines are good examples to copy from."

Maybe that is a bit unclear since it implies that packages/ is clear of 
distro files, which it isn't. Attached is the full version of the 
welcome message so people can suggest improvements.

regards,

Koen




--------------030704040207060800070102
Content-Type: text/plain;
 name="welcome.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="welcome.txt"

SGksCgpJZiB5b3UgYXJlIHJlYWRpbmcgdGhpcywgeW91IGhhdmUgYmVlbiBncmFudGVkIGNvbW1p
dCBhY2Nlc3MgdG8gdGhlIGF3YXJkIHdpbm5pbmcgT3BlbkVtYmVkZGVkIFByb2plY3QuIFRvIG1h
a2UgdGhpbmdzIGdvIHNtb290aGx5IHdlIGhhdmUgc29tZSBiYXNpYyBydWxlczoKCiAxKSBFdmVy
eXRoaW5nIG91dHNpZGUgb3JnLm9wZW5lbWJlZGRlZC5kZXYvcGFja2FnZXMvIHNob3VsZCBiZSB0
cmVhdGVkIHdpdGggZXh0cmVtZSBjYXJlLiBQbGVhc2UgY29tbXVuaWNhdGUgd2l0aCBvdGhlciBk
ZXZlbG9wZXJzIGZpcnN0IGlmIHlvdSB3YW50IHRvIHRvdWNoIHRoYXQgYXJlYS4gSWYgeW91IGFy
ZSBhIGRpc3RybyBtYWludGFpbmVyIHlvdSBhcmUgb2YgY291cnNlIGZyZWUgdG8gdG91Y2ggeW91
ciBkaXN0cm8gY29uZmlnIGZpbGVzIHdpdGhvdXQgYXNraW5nLiBJZiB5b3UgYXJlIGEgbWFjaGlu
ZSBtYWludGFpbmVyLCBwbGVhc2UgY29tbXVuaWNhdGUgZmlyc3QsIHNpbmNlIGl0J3MgZWFzeSB0
byBnZXQgdGhpbmdzIHdyb25nIGFuZCBub3QgYWxsIG1hY2hpbmVzIGFyZSBnb29kIGV4YW1wbGVz
IHRvIGNvcHkgZnJvbS4KCiAyKSBUaGluayB0d2ljZSBiZWZvcmUgdXNpbmcgYW4gb3ZlcnJpZGUs
IHVzdWFsbHkgb3ZlcnJpZGVzIGNhbiBiZSBhdm9pZGVkLCBlc3BlY2lhbGx5IG9uZXMgbGlrZSB0
aGVzZToKCiAgICAgZG9fY29tcGlsZSgpIHsKICAgICAgICAgb2VfcnVubWFrZSAKICAgICB9CQoK
ICAgICBkb19jb21waWxlX215Zmlyc3RkaXN0bygpIHsKICAgICAgICAgb2VfcnVubWFrZSAtRF9H
TlVfU09VUkNFCiAgICAgfQogICAgCiAgICBZb3UgbWF5IHRoaW5rICJJIGRvbid0IHdhbnQgdG8g
YnJlYWsgb3RoZXIgZGlzdHJpYnV0aW9ucyIsIGJ1dCBpbiA5OSUgb2YgdGhlIGNhc2VzIHlvdXIg
Zml4IHdpbGwgdW5icmVhayBvdGhlciBkaXN0cm9zIGFzIHdlbGwsIHNvIHVzaW5nIGFuIG92ZXJy
aWRlIHdpbGwgY2F1c2UgbW9yZSB3b3JrIGZvciBvdGhlciBkZXZlbG9wZXJzLCBzaW5jZSB0aGV5
IGhhdmUgdG8gd29yayBvdXQgdGhlIGZpeCBieSB0aGVtc2VsdmVzLiBZb3UgZG9uJ3Qgd2FudCBv
dGhlciBwZW9wbGUgdG8gc3BlbmQgd2Vla3MgdHJ5aW5nIHRvIHNvbHZlIGEgcHJvYmxlbSB3aGlj
aCBzb2x1dGlvbiBpcyBtYXNrZWQgYnkgYSBib2d1cyBvdmVycmlkZS4KCiAzKSBJdCdzIGZpbmUg
dG8gZml4IGEgcmVjaXBlIHlvdSBkb24ndCBtYWludGFpbiwgYnV0IGlmIHlvdSBhcmUgdW5zdXJl
IG9mIHlvdXIgY2hhbmdlLCB0cnkgdG8gY29udGFjdCB0aGUgbWFpbnRhaW5lciBvciwgaWYgbm8g
bWFpbnRhaW5lciBpcyBsaXN0ZWQsIHNlbmQgYSBub3RlIHRvIHRoZSBPRSBkZXZlbG9wZXIgbWFp
bGluZ2xpc3QuIAoKIDQpIFNwbGl0IHlvdXIgY2hhbmdlcyBpbnRvIHRoZWlyIGxvZ2ljYWwgc3Vi
cGFydHMuIEl0J3MgZWFzaWVyIHRvIHRyYWNrIGRvd24gcHJvYmxlbXMgYWZ0ZXJ3YXJkcyB3aXRo
IGEgYmluYXJ5IHNlYXJjaC4KCiA1KSBIYXZlIGEgY2xlYXIgY29tbWl0IG1lc3NhZ2VzLCBhbmQg
bWVudGlvbiB0aGUgYWZmZWN0ZWQgYnVnbnVtYmVycyBpZiBhcHByb3ByaWF0ZS4KCiA2KSBTeW5j
IGVhcmx5LCBzeW5jIG9mdGVuLiBOb2JvZHkgbGlrZXMgdG8gcmVpbnZlbnQgdGhlIHdoZWVsLiBN
ZXJnaW5nIGlzIGVhc3kgd2l0aCBtb25vdG9uZSwgc28gZG9uJ3QgaGVzaXRhdGUgdG8gcnVuIHN5
bmMganVzdCBiZWZvcmUgeW91ciBwbGFuZSB0YWtlcyBvZmYgYW5kIHlvdXIgd2lmaSBnZXRzIGRp
c2Nvbm5lY3RlZC4KCllvdSBjYW4gdmlldyBvdXIgcG9saWNpZXMgYW5kIGNoZWF0c2hlZXRzIGF0
OgogCiAqIGh0dHA6Ly93d3cub3BlbmVtYmVkZGVkLm9yZy93aWtpL1BvbGljaWVzCiAqIGh0dHA6
Ly93d3cub3BlbmVtYmVkZGVkLm9yZy93aWtpL01vbm90b25lUGhyYXNlYm9vawo=

--------------030704040207060800070102--
