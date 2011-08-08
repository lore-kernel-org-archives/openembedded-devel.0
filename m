Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QqVSy-0004kd-MF
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 21:26:24 +0200
Received: by yxi19 with SMTP id 19so2894371yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2011 12:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LfuvfPLroiO6fxbYzyPJOc7NXcwaZ2xxVCWhowdLnHQ=;
	b=Xw+SHBdpsmvo2D0IT9LDB1hGCzSTw0cAjtz/yngPCjlNNezclplqaHMImTOb327y0l
	quYVq1FkY3tC/Fw/hmi4t2GZ7AdPNWB16yJQFBAsPVVtViLXES355oVh+lcBPhpJEcV+
	GyAqZxneYU+ufbfeqMxU+y+BTvZqzfoDxMwbI=
MIME-Version: 1.0
Received: by 10.236.184.105 with SMTP id r69mr7234043yhm.179.1312831312626;
	Mon, 08 Aug 2011 12:21:52 -0700 (PDT)
Received: by 10.236.110.3 with HTTP; Mon, 8 Aug 2011 12:21:52 -0700 (PDT)
In-Reply-To: <1312830515.683.29.camel@jjg-linux>
References: <CAFu+nvEwf_hPbB0a21qJFWAHZqdCkb3MPaKaZcLFgD+xc7cGVw@mail.gmail.com>
	<4E15F6DD.2020308@mentor.com> <1312553761.14079.22.camel@jjg-linux>
	<CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
	<20110805151726.GB15632@rhein.zuhause.netz>
	<CAFu+nvEwGYd-t6n04yn41wd50+5zPoEu=5WVYxOmaWLDdyKdEQ@mail.gmail.com>
	<1312830515.683.29.camel@jjg-linux>
Date: Mon, 8 Aug 2011 15:21:52 -0400
Message-ID: <CAFu+nvG3fbS8ZvXmECicW=8OmMj1WnxBq_cHSpBspxg3f-6MJg@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: classpath in 2011.03-maintenance
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
X-List-Received-Date: Mon, 08 Aug 2011 19:26:24 -0000
Content-Type: text/plain; charset=UTF-8

I have no problem with it.  whatever is easier for review and testing.

On Mon, Aug 8, 2011 at 3:08 PM, Jesse Gilles <jgilles@multitech.com> wrote:

> On Fri, 2011-08-05 at 11:38 -0400, George C. Huntington, III wrote:
> > I posted a patch that makes the wrapper script return the error code
> > if it
> > fails after 5 retries.  it is on patchwork.
> > http://patches.openembedded.org/patch/7249/
>
> It seems like saving the javac script arguments into the ARGS variable
> is what broke the old behavior where -bootclasspath '' worked for
> building classpath.  Putting that part of the script back to the way it
> used to be fixes it.
>
> Do you want to merge this in with your error code return patch?
>
> --- a/recipes/ecj/files/ecj.in
> +++ b/recipes/ecj/files/ecj.in
> @@ -1,13 +1,16 @@
> -ARGS=${1+"$@"}
>  COUNT=5
>  END=0
> +RETURNCODE=0
>
>  while test "${COUNT}" -gt "${END}"
>  do
> - ${RUNTIME} -Xmx1024m -cp ${ECJ_JAR}
> org.eclipse.jdt.internal.compiler.batch.Main ${ARGS}
> + ${RUNTIME} -Xmx1024m -cp ${ECJ_JAR}
> org.eclipse.jdt.internal.compiler.batch.Main ${1+"$@"}
> + RETURNCODE=${?}
>  if test "${?}" -eq "${END}"
>  then
>     break
>  fi
>  COUNT=$(($COUNT-1))
>  done
> +
> +exit ${RETURNCODE}
>
> Otherwise, I can submit it as another patch, but it will depend on yours...
>
> Thanks,
> Jesse
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

