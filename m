Received: from [209.85.222.172] (helo=mail-pz0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MGzVe-0008FI-6A
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 20:05:18 +0200
Received: by pzk2 with SMTP id 2so402051pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 10:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3yUHsUEc9sgSrEjjw2EMEYGmhgBxDlmOfzHs0wT8Xyw=;
	b=Fj+3bwJoNQJGWTlmpNKm8Tq+bJYmQSmVf1vTlK6LdAf1GlWf4ZrUJICnKdXfzJnPP6
	EAfLbLD3L2Ob37F4wNJh7flwlOoM8+TnTxYcBkv/BH3crnT92sB0wMYZrW0bR1ZUc2OF
	Gsl3tw1kt5XLb+HsWZYmE2q0/QKBEeoUPzutU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=MNFID4fFpf3U2pTj/sNMf4/VQbfQpnz3KxygPUnpiVPE/Lmc02di4aL5Ml2y/zDqhQ
	MGV0rGUVeLemfgk60sqHDSPM3TYfWT77FC7ubWpVGEieE3GRVxI8cxCbx6hkQViPoEsh
	y/chuiaUifDiUWURM7+CG629G5E6M0AoEzTCQ=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.225.20 with SMTP id x20mr436395wfg.127.1245261288824; Wed, 
	17 Jun 2009 10:54:48 -0700 (PDT)
In-Reply-To: <h1ba8e$39u$2@ger.gmane.org>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
	<h1b9rb$39u$1@ger.gmane.org> <h1ba8e$39u$2@ger.gmane.org>
Date: Wed, 17 Jun 2009 10:54:48 -0700
X-Google-Sender-Auth: 3fe7f40fad9100e8
Message-ID: <b6ebd0a50906171054t7c29e3ddj9a2e1103530ef8fa@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 18:05:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Jun 17, 2009 at 10:47 AM, Rolf
Leggewie<no2spam@nospam.arcornews.de> wrote:
> Rolf Leggewie wrote:
>>
>> Chris Larson wrote:
>>>
>>> Set IMAGE_KEEPROOTFS to something other than the empty string to keep
>>> tmp/rootfs around after image creation, otherwise it will be removed
>>
>> We had something like this proposed a while ago by I think Lynn Lin.
>
> I revisited that thread and it was actually about something else.
>
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/24434
>
> My earlier comment does not apply.
>


Pushed once it got acked a couple times :)  Feel free to revert if
there's a good reason to do s
o.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


