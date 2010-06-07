Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OLcd7-0003hT-9g
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 15:44:58 +0200
Received: by wyb32 with SMTP id 32so2517529wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 06:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=DzVA89yDFxJeSBnHE3Vn5tNZ+x8o9c2CSI9SDu5eqnk=;
	b=DVR3i888eQtOptjF5xCUbR4h28K+4DECP0cHNAJeAXiqhcPV3nyRrgYU4/x6CcgK+O
	gdmi98XdxNLvJsGYYkrwBUuS3MaIg+hJX4uwk8l4mYsUGCpQNWxVbo8QftBCeNkUMIvh
	X71YlvnBT3TmVQ/tr0YKLEDVdKoVe9RuU4zjk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=j+dt61Xx32ccc/VjM7HRoxkp1r4yOBtxpJb1avvnA5H9OZ/YRcRsk2gHIYmh0itxP9
	XQmc64Akk/y5cvqcS4igWtlQ6pNvICgA37DfTXxR1WmCZpmSxG27W9iZTBbjkJKqRRZs
	69vHbn6AfXG20lW/rzEm3KMQmxJ28tmAiFmxs=
MIME-Version: 1.0
Received: by 10.216.155.141 with SMTP id j13mr2280380wek.7.1275918017280; Mon, 
	07 Jun 2010 06:40:17 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Mon, 7 Jun 2010 06:40:17 -0700 (PDT)
In-Reply-To: <AANLkTin8ybTRctnuKkR9h6lFHZFQDJTLlI7wB2vrc6AA@mail.gmail.com>
References: <1275504373-32623-1-git-send-email-cliff.brake@gmail.com>
	<AANLkTilBs6W1OMqbnKf9AujWBBGTWGyHo3Q3C9mr7URg@mail.gmail.com>
	<AANLkTin8ybTRctnuKkR9h6lFHZFQDJTLlI7wB2vrc6AA@mail.gmail.com>
Date: Mon, 7 Jun 2010 09:40:17 -0400
Message-ID: <AANLkTinbCpiUj5C33NE1kx07ZLKRljT92ip6-JD5Ftfn@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] packaged-staging.bbclass: fix issue with no SRC_URI
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
X-List-Received-Date: Mon, 07 Jun 2010 13:45:07 -0000
X-Groupsio-MsgNum: 19968
Content-Type: multipart/mixed; boundary=0016e649831c2f48f7048870d0ee

--0016e649831c2f48f7048870d0ee
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 4, 2010 at 3:47 PM, Chris Larson <clarson@kergoth.com> wrote:
> Please change ${srcuri} to $srcuri, so its very clear that its expanded in
> shell, rather than letting bitbake try to expand it and fail since its unset
> :)
>
> After that, Acked-by: Chris Larson <chris_larson@mentor.com>

Thanks!  Updated patch attached.  Can I get one more ack?

Thanks,
Cliff

--0016e649831c2f48f7048870d0ee
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-packaged-staging.bbclass-fix-issue-with-no-SRC_URI.patch"
Content-Disposition: attachment; 
	filename="0001-packaged-staging.bbclass-fix-issue-with-no-SRC_URI.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ga5bwvue0

RnJvbSBkZTBjZDgxMjQwNzdiNjJlOTZkM2MzNDg3YjVkOGNlY2FiNTVkODM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDbGlmZiBCcmFrZSA8Y2JyYWtlQGJlYy1zeXN0ZW1zLmNvbT4K
RGF0ZTogV2VkLCAyIEp1biAyMDEwIDE0OjAzOjE1IC0wNDAwClN1YmplY3Q6IFtQQVRDSF0gcGFj
a2FnZWQtc3RhZ2luZy5iYmNsYXNzOiBmaXggaXNzdWUgd2l0aCBubyBTUkNfVVJJCgpDdXJyZW50
bHkgd2l0aCBzcmN0cmVlLCB3ZSBnZXQgZXJyb3JzIGxpa2UgdGhlIGZvbGxvd2luZzoKfCArIHNy
Y3VyaT0KfCArICdbJyAnJyA9PSAnJyAnXScKfCArIHNyY3VyaT1PcGVuRW1iZWRkZWQKfCArIGVj
aG8gJ1NvdXJjZTogJwp8ICsrIGZpbmQgL3NjcmF0Y2gvb2Uvb2UtYnVpbGQvb2UvYnVpbGQvYW5n
c3Ryb20tMjAwOC4xL3RtcC93b3JrL2FybXY1dGUtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9hdXRv
dG9vbHMtZGVtby0xLjAtMjgtZzNhOTY2MjctcjAvc3RhZ2luZy1wa2cgJygnIC1uYW1lICcqLmxh
JyAtbyAtbmFtZSAnKi1jb25maWcnICcpJyAtdHlwZSBmCnwgKyBzdGFnZS1tYW5hZ2VyLWlwa2ct
YnVpbGQgLW8gMCAtZyAwIC9zY3JhdGNoL29lL29lLWJ1aWxkL29lL2J1aWxkL2FuZ3N0cm9tLTIw
MDguMS90bXAvd29yay9hcm12NXRlLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvYXV0b3Rvb2xzLWRl
bW8tMS4wLTI4LWczYTk2NjI3LXIwL3N0YWdpbmctcGtnIC9zY3JhdGNoL29lL29lLWJ1aWxkL29l
L2J1aWxkL2FuZ3N0cm9tLTIwMDguMS90bXAvcHN0YWdlL2FuZ3N0cm9tZ2xpYmMKfCAqKiogRXJy
b3I6IENPTlRST0wvY29udHJvbCBpcyBtaXNzaW5nIGZpZWxkIFNvdXJjZQp8IFRoZSBTb3VyY2Ug
ZmllbGQgY29udGFpbiB0aGUgVVJMJ3Mgb3IgZmlsZW5hbWVzIG9mIHRoZSBzb3VyY2UgY29kZSBh
bmQgYW55IHBhdGNoZXMKfCB1c2VkIHRvIGJ1aWxkIHRoaXMgcGFja2FnZS4gIEVpdGhlciBnbnUt
c3R5bGUgdGFyYmFsbHMgb3IgRGViaWFuIHNvdXJjZSBwYWNrYWdlcwp8IGFyZSBhY2NlcHRhYmxl
LiAgUmVsYXRpdmUgZmlsZW5hbWVzIG1heSBiZSB1c2VkIGlmIHRoZXkgYXJlIGRpc3RyaWJ1dGVk
IGluIHRoZSBzYW1lCnwgZGlyZWN0b3J5IGFzIHRoZSAuaXBrIGZpbGUuCnwKfCBpcGtnLWJ1aWxk
OiBQbGVhc2UgZml4IHRoZSBhYm92ZSBlcnJvcnMgYW5kIHRyeSBhZ2Fpbi4KfCBFUlJPUjogRnVu
Y3Rpb24gc3RhZ2luZ19wYWNrYWdlciBmYWlsZWQKTk9URTogcGFja2FnZSBhdXRvdG9vbHMtZGVt
by0xLjAtMjgtZzNhOTY2MjctcjA6IHRhc2sgZG9fcGFja2FnZV9zdGFnZTogRmFpbGVkCkVSUk9S
OiBUYXNrRmFpbGVkIGV2ZW50IGV4Y2VwdGlvbiwgYWJvcnRpbmcKClRoaXMgcGF0Y2ggZml4ZXMg
dGhhdCBpc3N1ZS4KCkFja2VkLWJ5OiBDaHJpcyBMYXJzb24gPGNocmlzX2xhcnNvbkBtZW50b3Iu
Y29tPgotLS0KIGNsYXNzZXMvcGFja2FnZWQtc3RhZ2luZy5iYmNsYXNzIHwgICAgMiArLQogMSBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvY2xhc3Nlcy9wYWNrYWdlZC1zdGFnaW5nLmJiY2xhc3MgYi9jbGFzc2VzL3BhY2thZ2VkLXN0
YWdpbmcuYmJjbGFzcwppbmRleCA4M2YzNTc4Li42OGM5NzNhIDEwMDY0NAotLS0gYS9jbGFzc2Vz
L3BhY2thZ2VkLXN0YWdpbmcuYmJjbGFzcworKysgYi9jbGFzc2VzL3BhY2thZ2VkLXN0YWdpbmcu
YmJjbGFzcwpAQCAtMzc0LDcgKzM3NCw3IEBAIHN0YWdpbmdfcGFja2FnZXIgKCkgewogCWlmIFsg
IiRzcmN1cmkiID09ICIiIF07IHRoZW4KIAkJc3JjdXJpPSJPcGVuRW1iZWRkZWQiCiAJZmkKLQll
Y2hvICJTb3VyY2U6ICR7U1JDX1VSSX0iICAgICAgICAgICAgICAgPj4gJHtQU1RBR0VfVE1QRElS
X1NUQUdFfS9DT05UUk9ML2NvbnRyb2wKKwllY2hvICJTb3VyY2U6ICRzcmN1cmkiICAgICAgICAg
ICAgICAgPj4gJHtQU1RBR0VfVE1QRElSX1NUQUdFfS9DT05UUk9ML2NvbnRyb2wKIAogCSMgRGVh
bCB3aXRoIGxpYnRvb2wgbm90IHN1cHBvcnRpbmcgc3lzcm9vdHMKIAkjIE5lZWQgdG8gcmVtb3Zl
IGhhcmRjb2RlZCBwYXRocyBhbmQgZml4IHRoZXNlIHdoZW4gd2UgaW5zdGFsbCB0aGUKLS0gCjEu
Ny4wLjQKCg==

--0016e649831c2f48f7048870d0ee--
