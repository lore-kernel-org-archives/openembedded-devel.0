Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OEkhr-0004DS-Ta
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 16:59:15 +0200
Received: by vws20 with SMTP id 20so2947614vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=mDSdFVS/dWk1FP2igB/1JeYna31PZ9tVZsanngRqh1E=;
	b=sLdmF0CdEjA7b/p7qkKuxIdQpU6htselvgYKBhzIvqXfrLms5csXVpwa+p5h9lq3V0
	ZKAshCTYUw3tgtahwPR4TIBUoz2Ko/FnfCp3FJ6KIfXFz93mhjl1kFqAaVdUeE5mmUVL
	vS8+zJl9uKKyK0lkO+iY2ZNoSO+S5LsJGICxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=E2rsl1ASCZoBKuWrrkxUOGuI3LLtbz0X581XCQMkw1GeViW0KDsWQbodXshXnPuZvj
	IPOkQrH19hxUA201xY6L2E3mWn4vo/6VOgXTcmwXJeWNmurBDeQAKRnBGaQutbPGngJG
	bFYrim2SvMt1hUSk6JHg4oUVwZjwSVte807ok=
MIME-Version: 1.0
Received: by 10.229.248.211 with SMTP id mh19mr1838910qcb.104.1274280789932; 
	Wed, 19 May 2010 07:53:09 -0700 (PDT)
Received: by 10.229.230.77 with HTTP; Wed, 19 May 2010 07:53:09 -0700 (PDT)
In-Reply-To: <20100514122113.GH3507@excalibur.local>
References: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-2-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-3-git-send-email-aalonso00@gmail.com>
	<20100514122113.GH3507@excalibur.local>
Date: Wed, 19 May 2010 09:53:09 -0500
Message-ID: <AANLkTikMtgHDODuAzt-efsFrMyEOUsv6mnrK-14x5LxA@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 3/5 v2] linux-xilinx-ml507: update kernel version
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
X-List-Received-Date: Wed, 19 May 2010 15:00:14 -0000
X-List-Received-Date: Wed, 19 May 2010 15:00:14 -0000
X-Groupsio-MsgNum: 19419
Content-Type: multipart/mixed; boundary=0016e6465166d3f9d40486f39d77

--0016e6465166d3f9d40486f39d77
Content-Type: text/plain; charset=ISO-8859-1

Hi Stefan,

I have been looking on how to reorder the patch,
but I'm still a git newbie :( and I don't quite well
understand how to regenerate my patch sets with
modifying the git log history, what I'm been doing
is to create a new branch fix my patchs and resend
them, thats clearly wrong.

Can you remove the patchs send on 2010-04-27 and
from the second patch set remove patch 3 and 4;
and use the path attached to make git bisec happy.

I will do my homework to avoid further integrations.

Thanks.

On Fri, May 14, 2010 at 7:21 AM, Stefan Schmidt
<stefan@datenfreihafen.org>wrote:

> Hello.
>
> On Thu, 2010-05-13 at 08:46, Adrian Alonso wrote:
> > * Update kernel version 2.6.33
> > * Include xilinx framebuffer patch
>
> You need to reorder your patchset to have the fb patch prior to this
> change.
> Without this git bisect will break.
>
> Looking over the patch I think it would be fine to have it merged into this
> patch as well. Small enough.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

--0016e6465166d3f9d40486f39d77
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-linux-xilinx-ml507-update-kernel-version.patch"
Content-Disposition: attachment; 
	filename="0001-linux-xilinx-ml507-update-kernel-version.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g9e9se3e0

RnJvbSBkZDRlZWUwZmNkZGY1ZGI1MmU0OWVlMGRmMjhmNTY1MDAyNzJjY2FhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBZHJpYW4gQWxvbnNvIDxhYWxvbnNvMDBAZ21haWwuY29tPgpE
YXRlOiBXZWQsIDE5IE1heSAyMDEwIDA5OjIzOjU4IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0gbGlu
dXgteGlsaW54LW1sNTA3OiB1cGRhdGUga2VybmVsIHZlcnNpb24KCioga2VybmVsIHZlcnNpb24g
Mi42LjMzCiogZnJhbWUgYnVmZmVyIGZpeCBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgbmV3IHhwc190
ZnQKICBkaXNwbGF5IG1vZHVsZXMKClNpZ25lZC1vZmYtYnk6IEFkcmlhbiBBbG9uc28gPGFhbG9u
c28wMEBnbWFpbC5jb20+Ci0tLQogcmVjaXBlcy9saW51eC9saW51eC14aWxpbngtbWw1MDcveGls
aW54ZmIucGF0Y2ggfCAgIDI2ICsrKysrKysrKysrKysrKysrKysrKysrCiByZWNpcGVzL2xpbnV4
L2xpbnV4LXhpbGlueC1tbDUwN19naXQuYmIgICAgICAgICB8ICAgIDcgKysrLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCByZWNpcGVzL2xpbnV4L2xpbnV4LXhpbGlueC1tbDUwNy94aWxpbnhmYi5wYXRjaAoKZGlm
ZiAtLWdpdCBhL3JlY2lwZXMvbGludXgvbGludXgteGlsaW54LW1sNTA3L3hpbGlueGZiLnBhdGNo
IGIvcmVjaXBlcy9saW51eC9saW51eC14aWxpbngtbWw1MDcveGlsaW54ZmIucGF0Y2gKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uZWMzMzM2MQotLS0gL2Rldi9udWxsCisrKyBi
L3JlY2lwZXMvbGludXgvbGludXgteGlsaW54LW1sNTA3L3hpbGlueGZiLnBhdGNoCkBAIC0wLDAg
KzEsMjYgQEAKK0Zyb20gNTRkYzliOWU5Y2NlZDMyMDRiOWQ5YThhMjczMTlkOWRlNjYyYWYzYiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEFkcmlhbiBBbG9uc28gPGFhbG9uc28wMEBn
bWFpbC5jb20+CitEYXRlOiBXZWQsIDMxIE1hciAyMDEwIDIyOjE0OjU1IC0wNjAwCitTdWJqZWN0
OiBbUEFUQ0hdIHhpbGlueGZiLmM6IGFkZCB0ZnQgY29tcGF0aWJpbGl0eSB2ZXJzaW9ucworCitT
aWduZWQtb2ZmLWJ5OiBBZHJpYW4gQWxvbnNvIDxhYWxvbnNvMDBAZ21haWwuY29tPgorLS0tCisg
ZHJpdmVycy92aWRlby94aWxpbnhmYi5jIHwgICAgMiArKworIDEgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRl
by94aWxpbnhmYi5jIGIvZHJpdmVycy92aWRlby94aWxpbnhmYi5jCitpbmRleCBlZDdjOGQwLi44
MjllZmFhIDEwMDY0NAorLS0tIGEvZHJpdmVycy92aWRlby94aWxpbnhmYi5jCisrKysgYi9kcml2
ZXJzL3ZpZGVvL3hpbGlueGZiLmMKK0BAIC00ODQsNiArNDg0LDggQEAgc3RhdGljIGludCBfX2Rl
dmV4aXQgeGlsaW54ZmJfb2ZfcmVtb3ZlKHN0cnVjdCBvZl9kZXZpY2UgKm9wKQorIC8qIE1hdGNo
IHRhYmxlIGZvciBvZl9wbGF0Zm9ybSBiaW5kaW5nICovCisgc3RhdGljIHN0cnVjdCBvZl9kZXZp
Y2VfaWQgeGlsaW54ZmJfb2ZfbWF0Y2hbXSBfX2RldmluaXRkYXRhID0geworIAl7IC5jb21wYXRp
YmxlID0gInhsbngseHBzLXRmdC0xLjAwLmEiLCB9LAorKwl7IC5jb21wYXRpYmxlID0gInhsbngs
eHBzLXRmdC0yLjAwLmEiLCB9LAorKwl7IC5jb21wYXRpYmxlID0gInhsbngseHBzLXRmdC0yLjAx
LmEiLCB9LAorIAl7IC5jb21wYXRpYmxlID0gInhsbngscGxiLXRmdC1jbnRsci1yZWYtMS4wMC5h
IiwgfSwKKyAJeyAuY29tcGF0aWJsZSA9ICJ4bG54LHBsYi1kdmktY250bHItcmVmLTEuMDAuYyIs
IH0sCisgCXt9LAorLS0gCisxLjYuNi4xCisKZGlmZiAtLWdpdCBhL3JlY2lwZXMvbGludXgvbGlu
dXgteGlsaW54LW1sNTA3X2dpdC5iYiBiL3JlY2lwZXMvbGludXgvbGludXgteGlsaW54LW1sNTA3
X2dpdC5iYgppbmRleCBlYzlkZTFjLi5mZDNlMzNlIDEwMDY0NAotLS0gYS9yZWNpcGVzL2xpbnV4
L2xpbnV4LXhpbGlueC1tbDUwN19naXQuYmIKKysrIGIvcmVjaXBlcy9saW51eC9saW51eC14aWxp
bngtbWw1MDdfZ2l0LmJiCkBAIC0xLDE3ICsxLDE4IEBACiByZXF1aXJlIGxpbnV4LmluYwogCiBE
RVNDUklQVElPTiA9ICJMaW51eCBrZXJuZWwgZm9yIFhpbGlueCBtbDUwNyBwbGF0Zm9ybSIKLUtF
Uk5FTF9SRUxFQVNFID0gIjIuNi4zMitnaXQiCitLRVJORUxfUkVMRUFTRSA9ICIyLjYuMzMrZ2l0
IgogCiBDT01QQVRJQkxFX01BQ0hJTkUgPSAieGlsaW54LW1sNTA3IgogREVGQVVMVF9QUkVGRVJF
TkNFID0gIi0xIgogREVGQVVMVF9QUkVGRVJFTkNFX3hpbGlueC1tbDUwNyA9ICIxIgogCiBQViA9
ICIke0tFUk5FTF9SRUxFQVNFfSIKLVBSID0gInIwIgorUFIgPSAicjEiCiAKLVNSQ1JFViA9ICJk
YzUzNzI1ZDIyNDA1ZTM4NGI5ODRkMjIyNTQyZjUyNmVhYTliODI5IgorU1JDUkVWID0gIjE3NDMx
NTQ3MTEzMTAwYTNhZTBhNjIyYjlmNzZhZDE3ZmI3NmViNTYiCiBTUkNfVVJJID0gImdpdDovL2dp
dC54aWxpbnguY29tL2xpbnV4LTIuNi14bG54LmdpdDtwcm90b2NvbD1naXQgXAorICAgICAgICAg
ICBmaWxlOi8veGlsaW54ZmIucGF0Y2g7cGF0Y2g9MSBcCiAgICAgICAgICAgIGZpbGU6Ly9kZWZj
b25maWciCiAKIGluaGVyaXQga2VybmVsIHhpbGlueC1ic3AKLS0gCjEuNi42LjEKCg==

--0016e6465166d3f9d40486f39d77--
