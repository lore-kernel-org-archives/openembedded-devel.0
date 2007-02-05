Received: from [59.160.240.219] (helo=rediffmail.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <suhas7860@rediffmail.com>) id 1HE0N0-0003gL-BZ
	for openembedded-devel@openembedded.org; Mon, 05 Feb 2007 10:42:42 +0100
Received: (qmail 27996 invoked by uid 510); 5 Feb 2007 09:39:43 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
Date: 5 Feb 2007 09:39:43 -0000
Message-ID: <20070205093943.27977.qmail@webmail94.rediffmail.com>
Received: from unknown (221.243.162.19) by rediffmail.com via HTTP;
	05 feb 2007 09:39:43 -0000
MIME-Version: 1.0
From: "Mr. Suhas Ghosh" <suhas7860@rediffmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-users@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Steps to Build a kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2007 09:42:42 -0000
Content-Type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi All,
   I want to make a simple kernel for ARM926EJ-s.
   I checked the Getting Started in the site.
   But all are not clear and I also tried the First Project
   mentioned there.=20
   I think I have to write three conf files=20
   and then from inside build I have to run bitbake bootstrap-image.
   If I am wrong I need your help.=20
   Three conf files are like this
   1.build/conf/local.conf=20
   2.org.openembedded.dev/conf/machine/machinename.conf
   3.org.openembedded.dev/conf/distro/machinename.conf

My path is like that
  /home/suhas/openembed/org.openembedded.dev
  /home/suhas/openembed/build
  /home/suhas/openembed/bitbake
  /home/suhas/openembed/OE.mtn
and I use these two export command
export BBPATH=3D/home/suhas/openembed/build:/home/suhas/openembed/org.open=
embedded.dev
export PATH=3D/home/suhas/openembed/bitbake/bin:$PATH

Now when I tried to run bitbake bootstrap-image from huild it always givin=
g
ERROR:unable to open /bitbake/conf/bitbake.conf files.

But when I am using the default conf file and running
bitbake nano it is running.

I can not fing out where is the problem.
So please help.

                                Thanking you in advance
                                      suhas
  =20
From janjans321@gmail.com Mon Feb 05 11:09:06 2007
Received: from [64.233.162.239] (helo
