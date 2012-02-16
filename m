Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RxyUK-0006p5-Hl
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:22:56 +0100
Received: by lahc1 with SMTP id c1so2277736lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=yew+kF32y930ccXnPofLjlc3gsrt+jh9ia2FcUWyKQ0=;
	b=M7arDDaSGrC21rRLGnc+Ca6ewfDCDKHrBAyh+uNpq0juivPPq4N6AqxJqrFfpacmUY
	8NXeVqAo6cu6s7ur3eUAAL6cYuZO01a4jVDWo+iaTJZZS8Fz9/jBR+d5FFbBYgheh523
	44oLygJWPTFtDNSn95YW8qHCeWdy6qQbRzrNU=
MIME-Version: 1.0
Received: by 10.152.145.137 with SMTP id su9mr1290102lab.23.1329387283711;
	Thu, 16 Feb 2012 02:14:43 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Thu, 16 Feb 2012 02:14:43 -0800 (PST)
In-Reply-To: <CAP9ODKo=b4rnmQb756h4NoSnVh3+D=SPak=-92rZ9W_5qN_VvA@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-3-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKo=b4rnmQb756h4NoSnVh3+D=SPak=-92rZ9W_5qN_VvA@mail.gmail.com>
Date: Thu, 16 Feb 2012 11:14:43 +0100
Message-ID: <CALbNGRQRELS3EARwj8ssK0MyuDJaBbebDrDcunGrwRMm89jV8A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][v2] 02/22] systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE
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
X-List-Received-Date: Thu, 16 Feb 2012 10:22:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 10:58 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Feb 16, 2012 at 00:02, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> The code in populate_packages_prepend to set SYSTEMD_PACKAGES to ${PN} a=
s
>> default was removed.
>>
>> V1 -> V2: Do not check configuration variables for cross and nativesdk
>>
>
> Those notes ought to be removed in last send, prior merging.
>
>
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> --
I'll wait a bit in case there are further comments and update the
commit messages affected in V3.

Andreas


