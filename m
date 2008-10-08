Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1KnZtJ-0006NM-Oy
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 16:19:54 +0200
Received: by yx-out-1718.google.com with SMTP id 4so703949yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=UZs6HmFgh1Etq3+biQzRHVcFV7sPU7ut1vkh9Di6sOs=;
	b=Uvvvwd3TpY+SfDkOHIr+IBamcnkPAMtj2IR8iY6rIrq3Nuf8EJ95puHn4Ndm4zi1jd
	zQZlLiNvaHPcXsIyaQMoskilk0RTocSnl98Q+0TcfjvpqcnGRaloVxEDkE7k/oS+Gloq
	kXczdcMdJWvwcw4Mun+AtH767FasDZCGjR7w4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=A7UWNiKC98tbylRSR0csr2eZ/CABBkEpM1PoJEFrLJ8FYUjW03djHjrrdnDZEjqhHM
	INGF+k1RSeNoPuzgl7nZbf3/VZaK93OWYOcoveVsUSaVoN1Qm4p+Qpq4agSfgrTOK7Ze
	uiJSh1VuaU2zj/A03fqZBnbY0JjG9VozmcIl0=
Received: by 10.142.125.9 with SMTP id x9mr3482948wfc.89.1223475314764;
	Wed, 08 Oct 2008 07:15:14 -0700 (PDT)
Received: by 10.150.212.20 with HTTP; Wed, 8 Oct 2008 07:15:14 -0700 (PDT)
Message-ID: <48239d390810080715l700d1ce4i46c1e1cc97279b3@mail.gmail.com>
Date: Wed, 8 Oct 2008 18:15:14 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Locale support.
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
X-List-Received-Date: Wed, 08 Oct 2008 14:19:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, all!

I have locale problems with my images, so I try to figure-out what I'm
doing wrong.

So, 'locale' command output is
LANG=ru_RU.UTF-8
LC_CTYPE="ru_RU.UTF-8"
LC_NUMERIC="ru_RU.UTF-8"
LC_TIME="ru_RU.UTF-8"
LC_COLLATE="ru_RU.UTF-8"
LC_MONETARY="ru_RU.UTF-8"
LC_MESSAGES="ru_RU.UTF-8"
LC_PAPER="ru_RU.UTF-8"
LC_NAME="ru_RU.UTF-8"
LC_ADDRESS="ru_RU.UTF-8"
LC_TELEPHONE="ru_RU.UTF-8"
LC_MEASUREMENT="ru_RU.UTF-8"
LC_IDENTIFICATION="ru_RU.UTF-8"
LC_ALL=

# opkg list_installed|grep glibc
glibc-binary-localedata-ru-ru - 2.6.1-r12 -
glibc-charmap-utf-8 - 2.6.1-r12 -
glibc-gconv - 2.6.1-r12 -
glibc-gconv-iso8859-1 - 2.6.1-r12 -
glibc-gconv-koi8-r - 2.6.1-r12 -
glibc-gconv-unicode - 2.6.1-r12 -
glibc-locale-ru - 2.6.1-r7 -
glibc-localedata-i18n - 2.6.1-r12 -
glibc-localedata-iso14651-t1 - 2.6.1-r12 -
glibc-localedata-iso14651-t1-common - 2.6.1-r12 -
glibc-localedata-ru-ru - 2.6.1-r12 -
glibc-localedata-translit-circle - 2.6.1-r12 -
glibc-localedata-translit-cjk-compat - 2.6.1-r12 -
glibc-localedata-translit-combining - 2.6.1-r12 -
glibc-localedata-translit-compat - 2.6.1-r12 -
glibc-localedata-translit-font - 2.6.1-r12 -
glibc-localedata-translit-fraction - 2.6.1-r12 -
glibc-localedata-translit-narrow - 2.6.1-r12 -
glibc-localedata-translit-neutral - 2.6.1-r12 -
glibc-localedata-translit-small - 2.6.1-r12 -
glibc-localedata-translit-wide - 2.6.1-r12 -
glibc-utils - 2.6.1-r12 -

But I have problems with lots of UTF-8 characters on file system
and applications. 'date' command works properly reporting according to locale.
wget, however have problems, inventing names which contain junk.
However, using scp, I'm able to store normal UTF-8-named files
from my desktop Debian. ASCII characters in names are always OK.
both wget and ls are stand-alone in my configuration.

Any ideas where to look?

All the best,
S.


