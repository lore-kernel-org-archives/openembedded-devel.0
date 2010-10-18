Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P7kBp-0005cC-7i
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 09:31:25 +0200
Received: by iwn2 with SMTP id 2so876500iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 00:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=w+Ujot5ovpeIr6ONfFVKrLIIftTEHu5uibACBeUOqVI=;
	b=tFG24vxMCMeLlUWIUKM9rQ7TzhlyF3wY6at3NzWTxxK7dadIFQP+b03hJHxs+Y+n3f
	Wf6uLgJzCdUoWZoO3qX64uJLxqgWRL4hpnDNcYH4l2ywnc8FpMfOoUnvkccFWByt697L
	KgtvewkPwBc3Ea1GVax2m9eEH4W4xn5CZwGow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vPkrvR0ARZ7uTe7DFiS+rMFjJiV+Rjx+IYAwdkRHxWwkNELnLeWy0R5xyL9LOqzYeU
	VbFBUobrggPvWrsU001ppcYwTE0/NMDmBlCmmc70L76lRace9JWtuygKruDw87VuXLbz
	iO7oXDwSmxOiyNK8954vIHEWGelevLkP6mgw8=
MIME-Version: 1.0
Received: by 10.42.13.75 with SMTP id c11mr2178049ica.481.1287387052010; Mon,
	18 Oct 2010 00:30:52 -0700 (PDT)
Received: by 10.231.162.68 with HTTP; Mon, 18 Oct 2010 00:30:51 -0700 (PDT)
In-Reply-To: <AANLkTikYuii4mEWxWh7HahgFVzYgaUz-DADyUyibqa4d@mail.gmail.com>
References: <1286544852-15635-1-git-send-email-msmith@cbnco.com>
	<AANLkTi=9bQq6q8NBTPgHhGMfmLs6Ae+oiLugNd+RyK=2@mail.gmail.com>
	<AANLkTikYuii4mEWxWh7HahgFVzYgaUz-DADyUyibqa4d@mail.gmail.com>
Date: Mon, 18 Oct 2010 18:00:51 +1030
Message-ID: <AANLkTimJLCis3ZhSs0Bqj=aY6hX3pXhPLJAj55uX8tdQ@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 07:31:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

>> On Fri, Oct 8, 2010 at 6:34 AM, Michael Smith <msmith@cbnco.com> wrote:
>>
>>> Use shutil.copytree() to copy D ("image") to PKGD ("package"). The
>>> previous system("cp %s/* ...") missed dotfiles/dirs at the top-level.

I expect this problem could be fixed by adding an extra line, e.g.
os.system('cp -pPR %s/.??* %s/' % (dest, dvar))

-Graham


