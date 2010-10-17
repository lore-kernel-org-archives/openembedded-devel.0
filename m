Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P7JhT-0003Ei-NY
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 05:14:21 +0200
Received: by wyb40 with SMTP id 40so2149195wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 20:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=IVl8BcyfRy0PHBT/bxz6k8J/ATg1RNLPKqoSWcTZUdg=;
	b=qOzkf4MTTQirwK9gi+m9L9AFO8WWOpVPlC1P/dm1K6271aGBehk6yjDBXZPwIJif3X
	tMwCVrovs2KRtruk6NuEA+68UAlWvU/bN4qdWB4+7jy/DS1272v2JzH3Crk/RtlcoGjC
	dHeLytnwz0ZI3ui+2IqB1INDF5JcnRLwAsxyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=qWDa0r3OiDK2sG976J25WqZTcMlfLUKCPDFfTVjdOgQIO72oNJHbc0PZIPGXZCVAGe
	7frcdTSwvlwc8m99/ZJv0jdxmwhfTD6qjwjQfOo3miqL7WytNw1eanX4KiQsqou1C46X
	MJNE+0NxyYjnlfG1e069pCTkVIt85lXd9OwOs=
Received: by 10.227.145.14 with SMTP id b14mr3049209wbv.24.1287285192592; Sat,
	16 Oct 2010 20:13:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sat, 16 Oct 2010 20:12:52 -0700 (PDT)
In-Reply-To: <AANLkTi=_3DKvm3bbHuvdvQYOS9M3WDKaBjg2aON=kYWS@mail.gmail.com>
References: <1287218988-3946-1-git-send-email-ynezz@true.cz>
	<AANLkTi=_3DKvm3bbHuvdvQYOS9M3WDKaBjg2aON=kYWS@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 16 Oct 2010 20:12:52 -0700
X-Google-Sender-Auth: InDLS3clcwvS1p7lcuR74Fe21aY
Message-ID: <AANLkTimu=q2VNcR=2fwNiRB0bojQQ70h1BVAEKa0pQUA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] oestats-client.bbclass: send USERDISTRO value
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
X-List-Received-Date: Sun, 17 Oct 2010 03:14:21 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 16, 2010 at 1:58 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> > -                       'distro': bb.data.getVar('DISTRO', d, True),
> > +                       'distro': bb.data.getVar('USERDISTRO', d, True),
> >                })
> >                if re.match("^\d+$", data): id=data
> >        except:
> > --
> > 1.7.0.4
> >
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


Is USERDISTRO always guaranteed to be set, or should it fall back to DISTRO?
 (haven't checked, I feel lazy, sue me :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

