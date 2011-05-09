Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mdpoole@troilus.org>) id 1QJRxd-0006ld-Mk
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 17:01:26 +0200
Received: from mail-ww0-f52.google.com ([74.125.82.52]) (using TLSv1) by
	na3sys009aob114.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTcgBInCywZNC8akpoP7Sir/qpLzzlOXL@postini.com;
	Mon, 09 May 2011 07:58:43 PDT
Received: by mail-ww0-f52.google.com with SMTP id 31so1453001wwb.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 07:58:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.221.106 with SMTP id q84mr2735139wep.94.1304951336954;
	Mon, 09 May 2011 07:28:56 -0700 (PDT)
Received: by 10.216.137.161 with HTTP; Mon, 9 May 2011 07:28:56 -0700 (PDT)
Date: Mon, 9 May 2011 10:28:56 -0400
Message-ID: <BANLkTikdEKTJVERFL42kzbqk4=u6_kVoYA@mail.gmail.com>
From: Michael Poole <mdpoole@troilus.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Bug in ti-eula-unpack.inc?
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
X-List-Received-Date: Mon, 09 May 2011 15:01:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

The version of ti-eula-unpack.inc in 2011.03-maintenance (commit
d886b980e) uses this to send each line of input to the installer:

  print >>f, "%s\n" % cmd

Is this right?  It causes problems for me when installing ti-cgt6x,
whereas removing the "\n" makes it work.  (This may be related to a
patch sent by Gary Thomas last year, in
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg09653.html
-- my user account does have write access to /opt, and I even have
some of the TI tools installed there, but removing the extra \n works
without adding --prefix.)

Michael


