Received: from mail-qc0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rangers.av@gmail.com>) id 1UHSK5-0004LU-8m
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 06:10:21 +0100
Received: by mail-qc0-f182.google.com with SMTP id k19so2606474qcs.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2013 21:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=QPdaaqjUtFHPz+TWtmgAfNp50wrRqeQy9P2RdiRVUAg=;
	b=vUvQKrOqLTh1wWr/rTEtJvjG0q3ZDgAxUeAPvxDX3TPPZGhAMRwG9sEI8X1AsN83dW
	WHptvZma+zLs4iWWvVsBmB0WrQ5Dowi3rCu+3ZUOdQs1yUr2r/DUK51jFa7q1RoXsoWg
	NSFzHzc71W6lG9v27OfjbAr76fwnbmxqZZCMWlCtRbfSDJFNceowQNemr3FM2XV/9OOc
	gXLMq3yyh+d9CuhzA0BwvVwZtlC7zpzEJEF4S4MYlr2ECF2jSv/cEVrIY1+6xNUZb0Mh
	j4Q5iT/Fs92CwC+3cPpUAGdS2n8NbwsGWNYcKKQxUn3aRo/LZ09Zd6tLplENBXjPPz+Y
	qDVw==
MIME-Version: 1.0
X-Received: by 10.49.59.67 with SMTP id x3mr20474986qeq.5.1363582357410; Sun,
	17 Mar 2013 21:52:37 -0700 (PDT)
Received: by 10.49.73.136 with HTTP; Sun, 17 Mar 2013 21:52:37 -0700 (PDT)
In-Reply-To: <1363332414-10484-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1363332414-10484-1-git-send-email-jukka.rissanen@linux.intel.com>
Date: Mon, 18 Mar 2013 10:22:37 +0530
Message-ID: <CAMQ5J2b5S7XgfJGb-tGr4xFMm69tX=n0iCwa1JeF7TmMaMO2cA@mail.gmail.com>
From: RaNgErS <rangers.av@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] wpa_supplicant: Location of systemd services files changed
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
X-List-Received-Date: Mon, 18 Mar 2013 05:10:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please delete my name from this list.


On Fri, Mar 15, 2013 at 12:56 PM, Jukka Rissanen <
jukka.rissanen@linux.intel.com> wrote:

>
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
>  .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend     |
> 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
> b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
> index 23dcc82..91ee4ad 100644
> ---
> a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
> +++
> b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
> @@ -8,7 +8,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
>
>  do_install_append () {
>      install -d ${D}${systemd_unitdir}/system
> -    install -m 644 ${S}/systemd/*.service ${D}${systemd_unitdir}/system
> +    install -m 644 ${S}/wpa_supplicant/systemd/*.service
> ${D}${systemd_unitdir}/system
>  }
>
>  # systemd.bbclass does not catch all multiple-instance-service-files
> --
> 1.7.11.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
     RaNgErS
THIS IS STRANGE

