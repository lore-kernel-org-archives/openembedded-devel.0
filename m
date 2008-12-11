Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LAnt7-0007cp-If
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 16:55:41 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1056414rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 07:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=K6eW2OfuwO5tg5o6tD1Ee09WdYnJMA+GfXdXKIUYee4=;
	b=ms8QapPLM5wwM8sVCwxZluVpu+GSDJoIyIkFXtC8klNXC1LL+YxMIHwaVZbTIA22bv
	w+SK9QuqrZRoxtRGD2HGikDwVjwPAocmK1Hw20TN/RymBQGaz9jr8JoyoQQHd8P4M7nT
	RlHFrdrzR7o7sEAkJBWuNZZM2BhK66ruBvlNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=IQ1K+wmcLlHvsU+q3r+sGHYPxksmkX59w7myVaiYX4ODl2aGb+RRgx4U/81t18pzWM
	gyZdncTlkL7ucMAQs1KMfKRrhAwo3n+lYRnWg8XNJLxAtolURBsOKtoNNKPPY8Ys2wal
	vYrLemeXOS80dQ2kMc/7S/6/xMoB9PuawaieI=
Received: by 10.140.157.1 with SMTP id f1mr1335265rve.196.1229010694785;
	Thu, 11 Dec 2008 07:51:34 -0800 (PST)
Received: by 10.141.142.17 with HTTP; Thu, 11 Dec 2008 07:51:34 -0800 (PST)
Message-ID: <f96d234e0812110751v47a0425ck15adb418fd4ae94a@mail.gmail.com>
Date: Thu, 11 Dec 2008 10:51:34 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1228972095.332522828@192.168.1.70>
MIME-Version: 1.0
References: <f96d234e0812101427r4afef700t6e8ea5ae77e71a40@mail.gmail.com>
	<1228972095.332522828@192.168.1.70>
Subject: Re: Building minimal-image with kernel24
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
X-List-Received-Date: Thu, 11 Dec 2008 15:55:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Dec 11, 2008 at 12:08 AM, Joshua Lamorie <jpl@xiphos.ca> wrote:
> Gidday there,
>
> Sorry for this simple question, but I've been using subversion up to now, and I can't figure out how to use git to checkout/pull/clone the documentation.  I can see the results of ...
>
> git-ls-remote  --heads git://git.openembedded.net/openembedded.git refs/heads/org.openembedded.documentation
>
> Then, inside the openembedded repository that I cloned with
>
> git clone git://git.openemebbeded.net/openembedded.git
>
> I can see the other branches with
>
> [jpl@megatron openembedded]$ git branch -r
>
> However, as suggested in http://www.kernel.org/pub/software/scm/git/docs/user-manual.html#examining-remote-branches, I do a checkout and I get the following.
>
> [jpl@megatron openembedded]$ git checkout -b documentation origin/org.openembedded.documentation
> fatal: Entry 'packages/tinylogin/tinylogin_1.4.bb' not uptodate. Cannot merge.
>
> There is an error in that .bb file (I just added a patch to bugzilla) but shouldn't I be able to get this branch without dealing with the uncommited changes to that file?

You will need to commit your local changes to a temp branch first.

git checkout -b myfixes org.openembedded.dev
git add ...
git commit

Now that you have no local changes, you can check out the doc

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


