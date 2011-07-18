Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QitCj-0003FK-L1
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 21:10:09 +0200
Received: by yxi19 with SMTP id 19so1495970yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 12:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=rKukpa64v1ee0gPdBGlVzYNhsM71pPwtKZA0cqIcm0k=;
	b=jERleb0OhpCGG95/OC3J+QHJvecJuZFdZJAtOe/PkJVQCmcZjdSQOESe9arZMpYuDb
	FYmIGpepiEYUoMQSs4qkvyzBdOy1NoYdROglak+MhlXgvp3vZrXvORvV3qJMBu2IeSwi
	aZ3Be3aj/UyPOf9Pyu4RGNx96PJu7vErI+I3A=
MIME-Version: 1.0
Received: by 10.236.176.105 with SMTP id a69mr8330529yhm.174.1311015964854;
	Mon, 18 Jul 2011 12:06:04 -0700 (PDT)
Received: by 10.236.95.42 with HTTP; Mon, 18 Jul 2011 12:06:04 -0700 (PDT)
In-Reply-To: <1310133659-22568-1-git-send-email-gchiii@mtiemail.com>
References: <1310133659-22568-1-git-send-email-gchiii@mtiemail.com>
Date: Mon, 18 Jul 2011 15:06:04 -0400
Message-ID: <CAFu+nvGydUSa6H7z4WoUbD-r6fU=bXu0W1=j517eDY6npm99yQ@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance] [PATCH] make the javac wrapper script pass back the return code
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
X-List-Received-Date: Mon, 18 Jul 2011 19:10:10 -0000
Content-Type: text/plain; charset=UTF-8

Please cherry-pick this into maintenance branch


On Fri, Jul 8, 2011 at 10:00 AM, George C. Huntington III <
gchiii@mtiemail.com> wrote:

> this will keep things from failing silently, while
> preserving the "try 5 times feature"
>
> Signed-off-by: George C. Huntington III <gchiii@mtiemail.com>
> ---
>  recipes/ecj/ecj-bootstrap-native.bb |    2 +-
>  recipes/ecj/files/ecj.in            |    4 ++++
>  2 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/ecj/ecj-bootstrap-native.bb b/recipes/ecj/
> ecj-bootstrap-native.bb
> index a11ba74..72571bf 100644
> --- a/recipes/ecj/ecj-bootstrap-native.bb
> +++ b/recipes/ecj/ecj-bootstrap-native.bb
> @@ -17,7 +17,7 @@ SRC_URI = "file://ecj.in"
>
>  S = "${WORKDIR}"
>
> -PR = "r4"
> +PR = "r5"
>
>  JAR = "ecj-bootstrap.jar"
>
> diff --git a/recipes/ecj/files/ecj.in b/recipes/ecj/files/ecj.in
> index 0fd4a65..66f4851 100755
> --- a/recipes/ecj/files/ecj.in
> +++ b/recipes/ecj/files/ecj.in
> @@ -1,13 +1,17 @@
>  ARGS=${1+"$@"}
>  COUNT=5
>  END=0
> +RETURNCODE=0
>
>  while test "${COUNT}" -gt "${END}"
>  do
>  ${RUNTIME} -Xmx1024m -cp ${ECJ_JAR}
> org.eclipse.jdt.internal.compiler.batch.Main ${ARGS}
> + RETURNCODE=${?}
>  if test "${?}" -eq "${END}"
>  then
>     break
>  fi
>  COUNT=$(($COUNT-1))
>  done
> +
> +exit ${RETURNCODE}
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

