Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1O0BT8-00009O-Dg
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 12:29:58 +0200
Received: by wwb13 with SMTP id 13so801456wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 03:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=Br0HGp+tU9Vmgv0ru2T2jisLf1K1R+IbNIO6O7OAYiM=;
	b=nTaVJVnd3z5DubpZqJE5TTtC3uKEHv5j4plhbxFbKutg9YXw2Tn0FgSGXP1Y+gw6ou
	COyR3dNRU6lr4em97aLjwXPxGlEvlwAdLk2TuJJaNLqYmVMRDOJOhRJC8t8Wki8wtKEx
	Xa6kzgQqID3/KNtRhVYp/qbu7D1jskXi5CIIg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SL/Y2EJ45WKE2pcH1Am0ALJQ9FYXzWJCcHb+b4JeeYH4/TfGU9vScssKYtOK0iD7b0
	Ax5A/flAjBVZiXnOspdS32I7kmb89ngYSQUA8B3V2C0xGzB7FMxXyWWp7rqAWwlpVQ4E
	Pkvlgy9bZHOKBX4OzRXxXs37n+Frmcm/cmI30=
MIME-Version: 1.0
Received: by 10.216.169.77 with HTTP; Fri, 9 Apr 2010 03:26:22 -0700 (PDT)
Date: Fri, 9 Apr 2010 14:26:22 +0400
Received: by 10.216.89.84 with SMTP id b62mr741611wef.226.1270808782950; Fri, 
	09 Apr 2010 03:26:22 -0700 (PDT)
Message-ID: <r2u48239d391004090326qb2a80dd6ic11530d737c6edde@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: postinst scripts and opkg configure
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
X-List-Received-Date: Fri, 09 Apr 2010 10:29:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

If I understand properly, during image preparation, postinst scripts
for each package are run.
If they fail, package gets status 'unpacked'. Otherwise, it gets
status 'installed'.

So, with recent images I have to run all postinst scripts again on
device for services
like udev or dropbear to work. These packages get 'installed' status,
so postinst
scripts won't normally run during 'opkg configure', but /etc/rc*d
links are not created for them during
image build. Any ideas on fixing, or what is really being wrong here?
I build quite
small image, so very few packages need this, but for bigger one there
might be lots of them. Any ideas on fixing?
Also, 'configure' runs as S99configure in 'S' runlevel. That means
that if package installs something there
like update-rc.d S 01 . that will be executed only on reboot, so it
needs to execute these init scripts directly from postinst.
Am I right?

Thanks a lot,
S.


