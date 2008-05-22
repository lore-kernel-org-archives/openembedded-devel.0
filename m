Received: from [209.85.142.185] (helo=ti-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1JzBYt-00013V-Hy
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 May 2008 16:14:34 +0200
Received: by ti-out-0910.google.com with SMTP id d10so64186tib.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2008 07:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	bh=dwJEshEgzFezcYToodR2TgXu0t2bW5W0pq817VkcxGg=;
	b=QgklBjxB1RZyVQkg4aNEdpgnj9zg+qBaS1QXGyNoTr/UKEwLZ3sdWMeVJfBo+a6qObjX3rulzKmbQtnmd/fpuvYd+zLlifZ2RvJnvTZKa+LSlTGYUVtGcvFeGXg3djgSUUrzv/Svlr3OpbrMSAGOeqzlFKnRzafvFVDs/EWzCTA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=ZWRx+q4Pv4XZPdcdLCN+KJ7jr1LWtTIwCAsw5X8LJNywxR0NCj7zatM911lU1h/9JJ7En4Zp0xYE5yYXM6g7wSogi5LWFEnPy/n/7vbluMb/J9aoQod/qkTz5FJBv3jBspSbGQpQF2yEHXG9gM4uxfW03DwT6mmCesUTSPe0TTI=
Received: by 10.150.84.41 with SMTP id h41mr252530ybb.215.1211465505323;
	Thu, 22 May 2008 07:11:45 -0700 (PDT)
Received: by 10.150.181.18 with HTTP; Thu, 22 May 2008 07:11:45 -0700 (PDT)
Message-ID: <70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
Date: Thu, 22 May 2008 16:11:45 +0200
From: "=?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?=" <enric.balletbo@telefonica.net>
Sender: eballetbo@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>
MIME-Version: 1.0
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>
X-Google-Sender-Auth: be7fc1bba9218472
Subject: GCC 4.3 fails to build glibc(-intermediate)
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
X-List-Received-Date: Thu, 22 May 2008 14:14:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

SGksCgpJIGhhdmUgdGhlIHNhbWUgcHJvYmxlbSwgYnV0IGF0IHRoaXMgbW9tZW50IEkgZG9uJ3Qg
aGF2ZSBpZGVhIGFib3V0IHNvbHV0aW9uLgoKUmVnYXJkcywKIEVucmljIEJhbGxldGJvIGkgU2Vy
cmEKCk9uIFdlZCwgTWF5IDcsIDIwMDggYXQgNzozMyBBTSwgTWF0dGhpanMgdmFuIGRlIFdhdGVy
Cm1hdHRoaWpzLnZhbi5kZS53YXRlciBhdCBnbWFpbC5jb20gd3JvdGU6Cgo+IEhpLAo+Cj4gSSdt
IHRyeWluZyB0byBnZXQgYW4gQVJNIEVBQkkgYnVpbGQgYmFzZWQgb24gZ2NjIDQuMyB3b3JraW5n
LiBJJ20gbm90Cj4gaGF2aW5nIG11Y2ggbHVjayB3aXRoIHRoYXQgc28tZmFyLgo+Cj4gVGhlIGJ1
aWxkIGZhaWxzIGF0IGdsaWJjLWludGVybmFsICh0cmllZCBib3RoIDIuNi4xIGFuZCAyLjcpIHdp
dGggYW4KPiBpbnRlcm5hbCBjb21waWxlciBlcnJvcjoKPiAuLi9pY29udi9za2VsZXRvbi5jOiBJ
biBmdW5jdGlvbiAnX19nY29udl90cmFuc2Zvcm1fdWNzNF9pbnRlcm5hbCc6Cj4gLi4vaWNvbnYv
c2tlbGV0b24uYzo4MDE6IGludGVybmFsIGNvbXBpbGVyIGVycm9yOiBTZWdtZW50YXRpb24gZmF1
bHQKPgo+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/IEFueSBpZGVhcz8KPgo+IFJlZ2FyZHMsCj4K
PiBNYXR0aGlqcyB2YW4gZGUgV2F0ZXIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdAo+IE9w
ZW5lbWJlZGRlZC1kZXZlbCBhdCBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCj4gaHR0cDovL2xpc3Rz
LmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZl
bAo+CgoKCi0tIApFbnJpYyBCYWxsZXRiw7IgaSBTZXJyYQo=


