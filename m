Received: from mail-qy0-f172.google.com ([209.85.221.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1ODJ3Q-0001oL-0T
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 17:13:28 +0200
Received: by qyk2 with SMTP id 2so4520275qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=xYeQxs6FBO6snwRSuwJXwKeeNXVYlNM8tG/1bCLH4sw=;
	b=CM6YWfsVzVMl34WUbqZ3pmH4FK/pFBOY64wJc9Lh08hR89LyI5+Fk3eRl+ZlGzHQr7
	bMXC8QMzD3iFZgKH5wa7YpmCY1TWzmWIggGJYNXASq4h5kzImh0BIbxn47Z7jpoaqXlp
	Zj1GwQlNuDWdH/sBs7RaSwiC3hUV83xGQWSQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ulqSWvY0EGSmQ+oZcVoZFE/hARzIaw0SEJrwaSyJR5Np4FKcMDBQRdrmnvSkYrWFiS
	FE0cVfGT4Cly8hrmQyaJJXGCXx/QARU4qu9IuU3TzcynPEJyIwoGjfPodefH1hd8jVdM
	3oiiERdEKaPbo1Dc4YWV5Xw59OCayAGmzvQQY=
MIME-Version: 1.0
Received: by 10.229.38.148 with SMTP id b20mr661178qce.139.1273936170195; Sat, 
	15 May 2010 08:09:30 -0700 (PDT)
Received: by 10.229.83.210 with HTTP; Sat, 15 May 2010 08:09:30 -0700 (PDT)
In-Reply-To: <hsmbkb$btq$1@dough.gmane.org>
References: <AANLkTil2qHZfmWTZXunj5iWnMZg0vFDDFEtzFSR9t7Ok@mail.gmail.com>
	<AANLkTinuZ0-7oI-cEQVr7YkFtZm8GLZ2_IIkIizB3wjA@mail.gmail.com>
	<AANLkTilk2Zb_F5psNZJNC8t9bfp7OOnMnAK5nyYIz96y@mail.gmail.com>
	<hsmbkb$btq$1@dough.gmane.org>
Date: Sat, 15 May 2010 08:09:30 -0700
Message-ID: <AANLkTinydII_uSb0INtCwN6oo4nBu3oYkhKG4ZCr71Uj@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building opkg-native on 64 bit Ubuntu
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
X-List-Received-Date: Sat, 15 May 2010 15:13:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, May 15, 2010 at 7:38 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:

> On 15-05-10 15:41, Steve Sakoman wrote:
>
>>>> x86_64-linux-libtool: link: cannot find the library `' or unhandled
>>>> argument `/..//lib'
>>>> make[2]: *** [libopkg.la] Error 1
>
> Could you have a look at libcurl.la in your x86_64 sysroots dir? I
> suspect that has the offending '/..//lib' in it.

Yes, libcurl.la did contain the offending '/..//lib'

> After removing that things build again for me. I suspect the curl-native
> recipe installs a broken .la file.

That worked for me too.  Seems that we are plagued by broken .la files!

Steve

> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL7rHLMkyGM64RGpERAgx7AJ96P9ZhaTX8yfrU0EC7TalIgIiMswCfcK2t
> 4rsf2YsXJEIYcxVAGV347Yk=
> =jvcK
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


