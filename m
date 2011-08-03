Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1QoWhn-00025o-58
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 10:21:32 +0200
Received: by iyj12 with SMTP id 12so753066iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 01:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OJeMh8Atrw0tZxOvFg/FNvHuGs4gMZTa9hfcSB8kJkc=;
	b=d7+Ajei+hBOrFMspf5bTESrmc/HIdMq/eG3R+mEqp2r7NXwJ3Z72f4NzribsI7iBR7
	jwDo9BInjPQr4qUMU7xXm/FwnpIMT9iBDF3Ld9xbnCynQEbMkLuYD6Or4yplDFPQyQjL
	OiSTZ1EmY0YvbtNk1fcaJ8gNsOmKC5Pe+JWTI=
MIME-Version: 1.0
Received: by 10.42.168.134 with SMTP id w6mr5065635icy.156.1312359428475; Wed,
	03 Aug 2011 01:17:08 -0700 (PDT)
Sender: vadmium@gmail.com
Received: by 10.231.209.71 with HTTP; Wed, 3 Aug 2011 01:17:08 -0700 (PDT)
In-Reply-To: <201108021201.38367.paul.eggleton@linux.intel.com>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7AA6B@nzc-ap-xch-02.ap.trimblecorp.net>
	<201108021201.38367.paul.eggleton@linux.intel.com>
Date: Wed, 3 Aug 2011 08:17:08 +0000
X-Google-Sender-Auth: M3Sedm-vuhwTmRqlxpnymwm3qzM
Message-ID: <CA+eR4cFQNLJFU7BMtWRXzFs8eOwAyrUf5C+wwkZVkU-O6Kst_w@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Bitbake syntax error
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
X-List-Received-Date: Wed, 03 Aug 2011 08:21:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/08/2011, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Tuesday 02 August 2011 02:43:05 Bernard Mentink wrote:
>> I am getting the following error while trying to build the
>> bootstrap-image, my bitbake is version 1.12.0.
>>
>>...
>> "/home/bmentink/devel/build/tmp/sysroots/i686-linux/usr/bin/opkg-make-in
>> dex", line 128
>>
>> |     print pkg_dir + "/" + old_filename
>> |
>> |                 ^
>> |
>> | SyntaxError: invalid syntax
>
> Someone posted this problem on IRC and eventually discovered that it was
> that
> /usr/bin/python was pointing to python3 (which isn't supported by BitBake=
).
> Is
> that what's happening on your system?

I install Bit bake with =E2=80=9Cpython2 setup.py install=E2=80=9D and this=
 has worked for me
on my computer where the default python is python3.

Perhaps the opkg-make-index script is picking up the host=E2=80=99s python
program when it should be getting one out of OE=E2=80=99s sysroot directory=
 or
something?


