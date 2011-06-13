Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1QWGbA-000483-V6
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 01:31:14 +0200
Received: from server ([unknown] [71.164.183.134]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMR007A2561VC60@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	13 Jun 2011 18:27:37 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 34991D; Mon, 13 Jun 2011 18:27:30 -0500
Received: from [192.168.1.3] by rkmorris.us with HTTP; Mon,
	13 Jun 2011 18:27:27 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Mon, 13 Jun 2011 18:27:27 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@lists.openembedded.org
Message-id: <1308007647883960500@rkmorris.us>
In-reply-to: <4DEFBF58.1010903@mentor.com>
References: <1307481663432021500@rkmorris.us> <4DEFBF58.1010903@mentor.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 1
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Builds Failing
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
X-List-Received-Date: Mon, 13 Jun 2011 23:31:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
Perhaps a dumb question, but ... do I need to do this? I can give it a try=
 (though I'm not quite sure I understand what needs to be changed). Just tr=
ying to figure out how to get this working again.
Thanks!
... Russell


On Wed, 06/08/2011 01:28 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 06/07/2011 02:21 PM, Russell Morris wrote:
> > Hi,
> >=20
> > I am trying to build OE with the latest source (i.e. from MASTER) -
> > but images that used to work are now failing (x11-gpe-image,
> > console-image). The failure seems to be in bash, as you can see in
> > the attached log files.
>=20
> Ah ha!  So, what's going on here is that upstream patches that we fetch
> have the 'bad' behavior of encoding '..' into the path and newer
> versions of 'patch' fail to apply these due to security concerns.
>=20
> We can kludge around this by making the recipe use say 'git' as the
> patch apply tool but someone should go yell at upstream.  Or we need to
> update to a newer version of bash where maybe upstream is publishing
> better behaved patches.
>=20
> --
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From pespin.shar@gmail.com Tue Jun 14 03:23:40 2011
Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QWIM0-0006Fb-GV
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 03:23:40 +0200
Received: by wye20 with SMTP id 20so4105275wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 18:20:15 -0700 (PDT)
DKIM-Signature: v
