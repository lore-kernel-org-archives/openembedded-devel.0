Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lvcargnini@gmail.com>) id 1KBJkd-0003H1-Gc
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jun 2008 03:24:47 +0200
Received: by nf-out-0910.google.com with SMTP id d21so67408nfb.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2008 18:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:to:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=zwviL3TcCxiEd/dWTZs2uuiWNe+nmGclgXAa9wiDV9s=;
	b=HvbJnb3Jban02YNY8MVvv2jlUwM2czvP6aTNwYRoNWoakEdpqFWOe1SdNknYjtt1/w
	9EZXoLdTzc8tL3JBaNooHE57DOPzdno2BP+VcpeoSDbJ7E8ETjqI7w7OWhRbrzStcx0e
	JLTTGkzVXWcB8iQa2wMWsXQnSwhAS1TqKtYmE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=D7tfvDF+xKGgUnoxmrT/Hb81QlCCCu1ii58tU4xe9d9WLSZEpOOXvtraBgCnN4uYRl
	V/Jei9ONueaO7lTf6//SGXEsoApbaZ+09diPiT9ss27NogTmCDToMA0XR+vAjFaTDMib
	J1ijXKHNpSWzig0j0NMFzeWE/IhodW1uhfnxo=
Received: by 10.210.51.10 with SMTP id y10mr949371eby.93.1214356966157;
	Tue, 24 Jun 2008 18:22:46 -0700 (PDT)
Received: by 10.210.24.18 with HTTP; Tue, 24 Jun 2008 18:22:45 -0700 (PDT)
Message-ID: <ae36f8040806241822h3d166c9an258840b67b96f415@mail.gmail.com>
Date: Tue, 24 Jun 2008 22:22:45 -0300
From: "=?UTF-8?Q?Lu=C3=ADs_Vit=C3=B3rio_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0806241551p1c67e603p211206de42240de@mail.gmail.com>
MIME-Version: 1.0
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<20080624095735.GB3500@aquilonia.hyboria> <g3rel4$tko$1@ger.gmane.org>
	<20080624190629.GI9891@smtp.west.cox.net>
	<48615E45.8080606@kernelconcepts.de>
	<20080624212909.GJ9891@smtp.west.cox.net>
	<c384c5ea0806241551p1c67e603p211206de42240de@mail.gmail.com>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 25 Jun 2008 01:24:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

UGVvcGxlIHdlIGFyZSBzdGFydGluZyB0byBkaXZlcmdlIGluIHRoaXMgaXNzdWUuCkp1c3QgY2hh
bmdlIHRoZSBTQ00gdG8gZ2l0IG9ubHkgdGhlIHJlc3Qga2VlcCB0aGUgc2FtZS4KCk9uIFR1ZSwg
SnVuIDI0LCAyMDA4IGF0IDc6NTEgUE0sIExlb24gV29lc3RlbmJlcmcKPGxlb24ud29lc3RlbmJl
cmdAZ21haWwuY29tPiB3cm90ZToKPiBIZWxsbywKPgo+IE9uIFR1ZSwgSnVuIDI0LCAyMDA4IGF0
IDExOjI5IFBNLCBUb20gUmluaSA8dHJpbmlAa2VybmVsLmNyYXNoaW5nLm9yZz4gd3JvdGU6Cj4+
IE9uIFR1ZSwgSnVuIDI0LCAyMDA4IGF0IDEwOjUxOjE3UE0gKzAyMDAsIEZsb3JpYW4gQm9vciB3
cm90ZToKPj4gQWxzbywgSSdtIG5vdCBzYXlpbmcgdGhhdCBmb3IgZXZlcnkgY29tbWl0IHRvIHRo
ZSBjb3JlIHlvdSBuZWVkIHRvIGRvIGEKPj4gZnJvbSBzY3JhdGNoIGJ1aWxkIG9mIGFsbCBjb21i
aW5hdGlvbnMsIGJ1dCB5b3Ugc2hvdWxkIHJlYXNvbmFibHkKPj4gY29uZmlkZW50IHRoYXQgdGhp
bmdzIHdvcmsuCj4+Cj4gV2UgY2FuIGRpcmVjdCBhbiBhdXRvYnVpbGRlciB0byBzb21lIGJyYW5j
aCBhbmQgbWFrZSBpdCBidWlsZCBhCj4gdmFyaWV0eSBvZiBtYWNoaW5lcywgYmVzaWRlcyB0ZXN0
aW5nIGJ5IHRoZSBicmFuY2ggbWFpbnRhaW5lcihzKQo+IHRoZW1zZWx2ZXMuCj4KPiBCdXQgYWdh
aW4sIEkgdGhpbmsgdGhpcyBpcyBvZiAqbGF0ZXIqIGNvbmNlcm4uCj4KPiBGaXJzdCB1cCBpcyBH
SVQgSU1ITywgYW5kIGdldHRpbmcgdGhlIGJhbGwgcm9sbGluZyBhZ2FpbiBmb3IgZXZlcnlvbmUu
Cj4KPiBSZWdhcmRzLAo+IC0tCj4gTGVvbgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKPiBodHRwOi8vbGlzdHMu
bGludXh0b2dvLm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRldmVs
Cj4KCgoKLS0gCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpUaGFua3MgJiYgUmVnYXJkcwpNLlNjLiBC
LlNjLiBMdcOtcyBWaXTDs3JpbyBDYXJnbmluaQpJRUVFIE1lbWJlcgpFbGVjdHJpY2FsIEVuZ2lu
ZWVyIEZhY3VsdHkgQCBQVUNSUwpJcGlyYW5nYSBBdmVudWUsIDY2ODEg4oCTIEJ1aWxkaW5nIDMw
ClAuTy4gQm94OiA5MDYxOS05MDAg4oCTIFBvcnRvIEFsZWdyZS9SUwpQaG9uZTogKzU1IDUxIDMz
MjAgMzUwMCBleHRlbnNpb246IDc2OTYKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCg==


