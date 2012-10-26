Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TReeP-0005lY-KY
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 09:48:17 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so958989bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 00:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=mOOBG3uiVylYRLfAPl0WqMjhPUU7PjDWPRWwzOyD9ow=;
	b=y38/eR/bZzytfOAaP78aRrUgGYEAz2LXy4TJ1mj6/jxGO+Of3ipi8nzgtfHgpaJCFD
	SRTLuV4WwXUVPoRWkXQdfIeh0+K70amYXidFmjkmjayvmYEBoaR0A9iUKoy/qp64bf3W
	GFC87Qv0k+apKLNBn2jg5eEff2n+xXQ0Y4POa5V1TdHVQqfXlm5tcxViCXli+Wx5rsYE
	nDNA7oyiCLjdssOJqO2Msmu/sKQq7931DiypuZhu9QdzLUSUWBY47ftsTPJQvJ6tNkO1
	D8rl1MeEB7AlBxRwkXqLHg/bcgvfIHOSVdS7jxbzgfSZ9NWjTOvSdI/7+YT99WSaKlAa
	kNTQ==
Received: by 10.204.148.12 with SMTP id n12mr6647125bkv.62.1351236887848;
	Fri, 26 Oct 2012 00:34:47 -0700 (PDT)
Received: from [10.54.74.11] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id r15sm188162bkw.9.2012.10.26.00.34.45
	(version=SSLv3 cipher=OTHER); Fri, 26 Oct 2012 00:34:46 -0700 (PDT)
Message-ID: <508A3B25.4070001@gmail.com>
Date: Fri, 26 Oct 2012 09:26:29 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.9) Gecko/20121025 Thunderbird/10.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1351191528-13408-1-git-send-email-martiert@gmail.com>
	<k6dd8v$tj0$1@ger.gmane.org>
In-Reply-To: <k6dd8v$tj0$1@ger.gmane.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-systemd][PATCH] meta-systemd: ntp: Change version to what is used in meta-networking.
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
X-List-Received-Date: Fri, 26 Oct 2012 07:48:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/26/12 09:14, Koen Kooi wrote:
> Op 25-10-12 20:58, Martin Ertsaas schreef:
> > Change version of ntp to match that in meta-networking. Also change
> > ntpdate to ntp-date to match the names used in meta-networking.
>
> While you are there, can you also disable the autoactivating for the unit?
> It's broken and I'm gettig tired of doing 'systemctl disable' on it for
> every system.
>
To disable the autoactivating, were you thinking linking
ntpd(ate).service to /dev/null, or something more sophisticated.

- Martin
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



