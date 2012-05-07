Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty@dasty.net>) id 1SRVYt-0000ur-0H
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 23:33:43 +0200
Received: by wgbds1 with SMTP id ds1so23334wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dasty.net; s=gmail;
	h=sender:subject:from:to:in-reply-to:references:content-type:date
	:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=JqxZABSOfwvRN19LC67d/m2CDAZkkiYxpYd0bBRPbFY=;
	b=TbVADYXXdpTieUJdZI1kY8KgLtP8TEhzi8+ehkD9dkwlSNIMggUulIVt2bZvpRpcvJ
	qDD/nmlHRh2ibENcYP8OlDYEnAXWuTlnxYJvDAqwvWREjbT0+/+7GoYUnlxIcD2OluDs
	ExD7vHq3gki/jeH0H3pQWFJzT66EydHOGydKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:subject:from:to:in-reply-to:references:content-type:date
	:message-id:mime-version:x-mailer:content-transfer-encoding
	:x-gm-message-state;
	bh=JqxZABSOfwvRN19LC67d/m2CDAZkkiYxpYd0bBRPbFY=;
	b=HuUkiLE9AH5Ci1IPVsB1NOs1vTRm2rFVcyEeWXcjPdCicimtj4RfgiflQNFFC34k+Q
	epBBCJmHYn6cSwN9s/wY2IVm8behArFnWKZWkmLA1X1WBXR3vo/ZIK5ajQd9h9nRiBHH
	VAqdw5yk2SZnKjvZNfKEqB0/3efpxlznn4MDiEmJGznEfEuENK379tLA6gFakOAt9QK9
	QG9yYD2ZfvrC0WAeGEVUCs1H32N4pZIhaT46tthHWhOsuic+RacE10GkIqKoHiYgC/xN
	NZXyVQ8f722nK+OI1eoY4PxIud+NLhEBcCFyHDLMxG6WinPUpGb1uU4Ldd9e4WuJLlV8
	u3Iw==
Received: by 10.180.106.9 with SMTP id gq9mr38618933wib.17.1336425832418;
	Mon, 07 May 2012 14:23:52 -0700 (PDT)
Received: from [192.168.1.20] (85-127-117-46.dynamic.xdsl-line.inode.at.
	[85.127.117.46])
	by mx.google.com with ESMTPS id r2sm20157018wif.7.2012.05.07.14.23.50
	(version=SSLv3 cipher=OTHER); Mon, 07 May 2012 14:23:51 -0700 (PDT)
Sender: Radek Dostal <dasty@dasty.net>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4FA839CD.4020203@mlbassoc.com>
References: <1336391680.3417.7.camel@dasty-laptop>
	<4FA7B9DF.60304@mlbassoc.com> <1336394035.3417.12.camel@dasty-laptop>
	<CAMKF1sonQpWBRYNSapa16EDGyyQCiRr5AmKoSx02xnqzzn+5yA@mail.gmail.com>
	<1336424471.2074.4.camel@dasty-laptop> <4FA839CD.4020203@mlbassoc.com>
Date: Mon, 07 May 2012 23:23:48 +0200
Message-ID: <1336425828.2074.11.camel@dasty-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3
X-Gm-Message-State: ALoCoQkLfj0ZTIPK7RYOHUclrNXvjmJS4DjCfQx/AZCvgT5KmQsyY9C5M7MPKEUPgB6nDS/Ff47Q
Subject: Re: Simultaneous build of two intree packages
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
X-List-Received-Date: Mon, 07 May 2012 21:33:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-07 at 15:08 -0600, Gary Thomas wrote:
> I think that your recipes are not well behaved - two recipes probably
> should not be creating the same file in such a way.
> 
> Can you post the recipes, or at least the code snippets that break? 

I agree usually it should not be a case, but since both of the recipes
are in-tree recipes within the same tree, than obviously tree is the
shared resource.

Pasting the recipes would probably not be very helpful. Only thing they
do is that they call the cmake bellow and actual error occurs within
cmake scripts. 

Just in order to give overview: First whole structure is configured.
Configuration is shared between all the recipes. Second actual make is
called on different subdirectories. Cmake in its nature is not designed
to be able to started multiple time over same tread (with exception of
starting it via -jX).

Thanks,
Radek



