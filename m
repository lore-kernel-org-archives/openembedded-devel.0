Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwhoosier@gmail.com>) id 1IIYQu-00068I-FJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2007 01:25:48 +0200
Received: by wa-out-1112.google.com with SMTP id l24so2644279waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2007 16:23:13 -0700 (PDT)
Received: by 10.115.22.1 with SMTP id z1mr7251774wai.1186528992976;
	Tue, 07 Aug 2007 16:23:12 -0700 (PDT)
Received: by 10.114.73.7 with HTTP; Tue, 7 Aug 2007 16:23:12 -0700 (PDT)
Message-ID: <d543f5920708071623g37c9844fs47db2c11d73d1ec9@mail.gmail.com>
Date: Tue, 7 Aug 2007 18:23:12 -0500
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Google-Sender-Auth: 77c5bdc610fc9b0d
Subject: Inheriting conditionally
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
X-List-Received-Date: Tue, 07 Aug 2007 23:25:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I'm search for a syntax that will allow me to inherit from certain
classes only when using a particular distribution. Is there some good
way to do this, like maybe:

  python {
    if bb.getVar("DISTRO") == "mydistro"
      # some API call to add inherited class
  }

The particular thing I want to accomplish is to use the update-rc.d
functionality to start a daemon systemwide only when targeting my own
distro; it's nonstandard and wouldn't be appropriate for most
distributions.

Thanks,

Matt


