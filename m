Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <brandhetlampje@gmail.com>) id 1M8UkB-00027a-14
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 09:37:11 +0200
Received: by fg-out-1718.google.com with SMTP id e12so472517fga.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 00:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=zvN8sAfWyRW8f2z3RrzxBWnUIg0jr37LW3UL5e2drJY=;
	b=nd+1e+FqVZKNfqPL2/1+7xTgXEB3++nhk/bZTaeSLFTc9Z8MOecdg3qEU8ZQXkesW2
	biQ1RbgAn+DhllXsRvxkjrkB9ItVS8HVZ6fsJJoM2/2h2RgRVgfz1RgDlz4Hd9t8PXEb
	ZwVaW58fIPO4/nBrP+70C/9VM+hAor6f7C/F0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ASLrg2N5tzboa0Tnrf/1/Y13jnwavv67moSaYSF9AhuuB17Tgh9WVYFgHoaeekUdsq
	ZDmM2m2cTXGTWwGd2i5mghMmeBTprFFKw5Rn5r6fw3kKvultIf+poPwsLwjFcZW4IDc2
	4yUnCekMMgPT+ASXXXsmG+C98Lojqh4tBOuto=
MIME-Version: 1.0
Received: by 10.86.36.11 with SMTP id j11mr5423609fgj.56.1243236552480; Mon, 
	25 May 2009 00:29:12 -0700 (PDT)
In-Reply-To: <21C24B5F488E484BACDD5B7BA2FCAC95010447EE@normxdc02.nucsafe.com>
References: <AcnZhIFBBya9Yoj7TkquCJm/6oUucQ==>
	<21C24B5F488E484BACDD5B7BA2FCAC95010447EE@normxdc02.nucsafe.com>
Date: Mon, 25 May 2009 09:29:12 +0200
Message-ID: <6978a1740905250029r7a10dc38jf3c10e1dc72b3655@mail.gmail.com>
From: s hakkesteegt <brandhetlampje@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Compulab cm-x300 support
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
X-List-Received-Date: Mon, 25 May 2009 07:37:13 -0000
X-Groupsio-MsgNum: 10701
Content-Type: multipart/mixed; boundary=000e0cd25b6415202b046ab791c6

--000e0cd25b6415202b046ab791c6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Thad,

The board hasn't been added because I'm not sure it's done completely
correct yet.
The board recipe seems to work correct for me, but my Linux-kernel recipe
isn't the most elegant yet (does work, but will not be approved for OE
repository).

I attached the machine conf, you can use it locally. Kernel I'm currently
using is 2.6.26, pre-patched with Compulab patches. 2.6.29 also in progress,
hope to be able to add that sooner or later in a correct way.


As I've suffered from a JFFS2 bug one two cm-x300 modules, which made the
rootfs corrupt within one reboot (on NAND flash), I'm very curious to your
experience with the module. Rootfs on USB-stick seems to work correct
though.


Siebren Hakkesteegt (tsjsieb)





On Wed, May 20, 2009 at 9:52 PM, Thad Thompson <TThompson@nucsafe.com>wrote:

> Hey Ya'll,
> I'm a newb here, so first let me say that after working with Open
> Embedded for a few days, it is quite the impressive stuff. After setting
> up and maintaining an in-house embedded Linux build system for a while,
> I'm quite over doing it all myself.
>
> So my question: Does anybody have a working setup for the Compulab
> cm-x300 board yet? I don't find it anywhere in git, but I've noticed
> that it's being built by tsjsieb on Tinderbox. If possible, I'd like to
> see this board in the mainline git tree but don't see any point in
> duplicating work (or stepping on somebody).
>
> Thanks!
> -Thad Thompson
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

--000e0cd25b6415202b046ab791c6
Content-Type: application/octet-stream; name="cm-x300.conf"
Content-Disposition: attachment; filename="cm-x300.conf"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fv4umq510

I0BUWVBFOiBNYWNoaW5lCiNATmFtZTogQ29tcHVsYWIgY20teDMwMAojQERFU0NSSVBUSU9OOiBN
YWNoaW5lIGNvbmZpZ3VyYXRpb24gZm9yIENvbXB1bGFiIGNtLXgzMDAgY29tcHV0ZXIgbW9kdWxl
ClRBUkdFVF9BUkNIID0gImFybSIKR1VJX01BQ0hJTkVfQ0xBU1MgPz0gImJpZ3NjcmVlbiIKCk9M
REVTVF9LRVJORUwgPSAiMi42LjE2IgpQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9rZXJuZWwg
PSAibGludXgiCgpQQUNLQUdFX0VYVFJBX0FSQ0hTID0gIiBpd21teHQiCgpyZXF1aXJlIGNvbmYv
bWFjaGluZS9pbmNsdWRlL3R1bmUteHNjYWxlLmluYwoKU0VSSUFMX0NPTlNPTEUgPz0gIjM4NDAw
IHR0eVMyIgpDTVgzMDBfRVJBU0VCTE9DS19TSVpFID89ICIweDIwMDAwIgoKIyB1c2VkIGJ5IG9w
aWUtY29sbGVjdGlvbnMuaW5jClJPT1RfRkxBU0hfU0laRSA/PSAiMzIiCgojIGZvciBOQU5EIGZs
YXNoLgpFWFRSQV9JTUFHRUNNRF9qZmZzMiA9ICItLWxpdHRsZS1lbmRpYW4gLS1lcmFzZWJsb2Nr
PSR7Q01YMzAwX0VSQVNFQkxPQ0tfU0laRX0gLS1wYWQgLS1uby1jbGVhbm1hcmtlcnM7XAoJc3Vt
dG9vbCAtaSAke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmpmZnMyIFwK
CS1vICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS5yb290ZnMtc3VtbWFyeS5qZmZz
MiBcCgktZSAke0NNWDMwMF9FUkFTRUJMT0NLX1NJWkV9IC1wOyBcCgljZCAke0RFUExPWV9ESVJf
SU1BR0V9OyBcCglybSAtZiAke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTElOS19OQU1FfS5y
b290ZnMtc3VtbWFyeS5qZmZzMjsgXAoJbG4gLXMgJHtJTUFHRV9OQU1FfS5yb290ZnMtc3VtbWFy
eS5qZmZzMiAke0lNQUdFX0xJTktfTkFNRX0ucm9vdGZzLXN1bW1hcnkuamZmczIgXAoJIgoKTUFD
SElORV9GRUFUVVJFUyA9ICJrZXJuZWwyNiBwY21jaWEgdXNiaG9zdCB1c2JnYWRnZXQgdG91Y2hz
Y3JlZW4gYWxzYSBpd21teHQgd2lmaSBibHVldG9vdGgiCgpVQk9PVF9FTlRSWVBPSU5UID0gIkEw
MDA4MDAwIgo=

--000e0cd25b6415202b046ab791c6--
