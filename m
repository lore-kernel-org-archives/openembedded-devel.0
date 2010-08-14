Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OkIxE-0005yK-U8
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 17:47:43 +0200
Received: by fxm6 with SMTP id 6so2411229fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=oBuevdije6T+k8Uh4CWJgfeCLXaqKLdCkb/dacVnDXM=;
	b=NOMw+BGeANEr5M8ES/cFkA8TFJLotUyAbTTDaN7/ji2V4HrjCmuBwAbIIQ32fkC0K6
	CXx/OxPab4kkRsSxXo6ES7rY/tvFFlOP3nS+gXLKtag/rgrgQnOX3aX8tR79wJI+BAB4
	yToUqXHM0eJdxb5+/eQorz0db3OgHTjW0ELyA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=IYlnx64OW8BfrGhxG4QN8M0eFP5AK1YI0IIQvVDp82tDM8tZcIlmTkct0BYSwqnfJ1
	cS3gsJOvSOZ4LAYjvHZgnw3rAB2jvtQ9QC4xvlaI3rsrY/JYmvLyJq3MsAP515K7ED0i
	EfTUL6eupVzVsSxTobH8fQYK9ywNY61jx1dHg=
Received: by 10.223.107.211 with SMTP id c19mr3369116fap.20.1281800829176;
	Sat, 14 Aug 2010 08:47:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sat, 14 Aug 2010 08:46:49 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Sat, 14 Aug 2010 09:46:49 -0600
Message-ID: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Sat, 14 Aug 2010 15:47:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

This is about the 4th time that I've `rm -rf`-d everything and started from
scratch and never yet got a working `bitbake omap3-console-image`

Every time I `git pull` it's a different set of problems. It's never the
same package twice, but they never all compile for the basic console image
anywhere from 4 to 20 hours in.

Fortunately, I do have a machine that did build omap3-console-image a few
weeks ago at work. But I've never been able to get it on my machine at home
(same os) to start playing around with.

What needs to happen in order for things to git checked that they work with
at least a few common meta-tasks before being pushed out?
And is there anything I can do to help? (Donate some machine time to run
tests, for example)


Obviously, we all have our day jobs and whatnot, but this is becoming really
frustrating for me and I'd like to see things improve.

AJ ONeal

