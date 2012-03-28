Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SD0zV-0005gn-Gh
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 00:05:17 +0200
Received: by lagw12 with SMTP id w12so1788686lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=AUWECzS6tcVxmoU7qVx+HWpuyvBz9EWFBTiWQeK9m0Q=;
	b=xhph2ts5KFnn/ZEcvuE9k8TTIMKMHO9ZM3inJJ9PQyAxEFjE0janxcWn4lhV36au9D
	wun58bxzhpbUfz0oOzgel5kAQeG3jC73r9jQtiOw+f2wzlPR3sVMnoaxDLX/a+EWR8Ft
	1MKK20i8eDYebW0ZmDUNSDlvKL4Cqi5lq1HIADLs1zZgm7cJoNE5DeYEVohAgCzxULvq
	ng35UV6zYSQDk9QNJiGVYwLDUk88fuOwpvveYRsypujnHqDKOs82i/JwvYvzC1NxtWyp
	skr5+0UcJayrozNf3ceRFX6iYiSWttMyOWg6z+k7JawAoWMQNafKOPplWje/T0y/2pd3
	WuJA==
Received: by 10.152.102.173 with SMTP id fp13mr24650830lab.38.1332971774912;
	Wed, 28 Mar 2012 14:56:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Wed, 28 Mar 2012 14:55:44 -0700 (PDT)
In-Reply-To: <1332947449-3431-1-git-send-email-b19537@freescale.com>
References: <1332947449-3431-1-git-send-email-b19537@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Mar 2012 14:55:44 -0700
Message-ID: <CAMKF1soqcNd_EqLAcuq-6kz_AMOQS_9eeeLiHtM8903gP--H6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] tclap: add v1.2.1
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
X-List-Received-Date: Wed, 28 Mar 2012 22:05:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 8:10 AM,  <b19537@freescale.com> wrote:
> +do_install_prepend() {
> + =C2=A0 =C2=A0install -d ${S}/docs/html
> +}

why do you need to create a directory in source dir after you have
compiled the application. why not during do_unpack or some earlier
tasks


