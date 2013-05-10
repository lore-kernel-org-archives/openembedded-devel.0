Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Uar0t-0006Vh-6x
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 19:21:47 +0200
Received: by mail-vc0-f169.google.com with SMTP id kw10so186740vcb.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=3q1R+v6Egd4QSkDcsEjCR+mrEJp6U9sw4xIXWtaKSNQ=;
	b=SNWdVffWehNzv+2bX3LYT5hAJbZ/BwAEx5vdTCh8if909WwgGrIZ64zzhuFC3jOdDn
	vsOetz9kcmpMRwzSz785ALgpICa745U9VHaKm5zwDKbTVdDPLnZpFQ1Z8+XXqxrbaSf3
	vdZF01c1u/C8sFKXHpoMgqdajCSEb9Qt7XQcMqOvizLo8WxdOpXRBfVvEh64ycrmNoZQ
	5tBT5t2miFhRM3cbOZxE2SmtCNKo86Vgz5KA4K+KMHADqyVQNHzd9CQN4CzvSmFeYGgA
	g11cG7cvrUY/5cOBE1H90Go2qbuOCADm7MpkHXAYa1AENtZnt4nIrPugw+TN9VQvP6GR
	740Q==
MIME-Version: 1.0
X-Received: by 10.52.19.45 with SMTP id b13mr10018432vde.83.1368205421049;
	Fri, 10 May 2013 10:03:41 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Fri, 10 May 2013 10:03:40 -0700 (PDT)
In-Reply-To: <518CCC61.5080504@opendreambox.org>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
	<1367966513-12566-7-git-send-email-schnitzeltony@googlemail.com>
	<518CCC61.5080504@opendreambox.org>
Date: Fri, 10 May 2013 19:03:40 +0200
Message-ID: <CALbNGRQZ-6XVzhCOZ7mX8_MF0Cqgzu4W49TmmWqxBCEKZ6ENHA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-gnome 06/15] poppler: remove unrecognized configure options
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
X-List-Received-Date: Fri, 10 May 2013 17:21:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2013 at 12:30 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 08.05.2013 00:41, Andreas M=C3=BCller wrote:
>> warning was:
>>
>> | configure: WARNING: unrecognized options: --disable-poppler-qt, --disa=
ble-abiword-output
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-oe/recipes-support/poppler/poppler.inc       |    1 -
>>  meta-oe/recipes-support/poppler/poppler_0.18.4.bb |    2 --
>>  2 files changed, 0 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/poppler/poppler.inc b/meta-oe/recip=
es-support/poppler/poppler.inc
>> index d0c0074..11286bc 100644
>> --- a/meta-oe/recipes-support/poppler/poppler.inc
>> +++ b/meta-oe/recipes-support/poppler/poppler.inc
>> @@ -11,7 +11,6 @@ EXTRA_OECONF =3D "\
>>      --enable-xpdf-headers \
>>      --disable-gtk-test \
>>      --disable-poppler-qt \
>> -    --disable-poppler-qt4 \
>>      --enable-zlib \
>>  "
>
> This hunk doesn't match the cited warning.
>
> Regards,
> Andreas
Oops - will send a correcting patch.

Andreas


