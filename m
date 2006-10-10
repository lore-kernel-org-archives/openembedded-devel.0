Received: from [64.233.162.192] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <nicolasfr@gmail.com>) id 1GXHnt-0004u7-UD
	for openembedded-devel@openembedded.org; Tue, 10 Oct 2006 15:37:54 +0200
Received: by nz-out-0102.google.com with SMTP id v1so476090nzb
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Oct 2006 06:31:43 -0700 (PDT)
Received: by 10.64.253.12 with SMTP id a12mr11269258qbi;
	Tue, 10 Oct 2006 06:31:42 -0700 (PDT)
Received: by 10.65.197.7 with HTTP; Tue, 10 Oct 2006 06:31:42 -0700 (PDT)
Message-ID: <b9481e140610100631u25d9bc4dm7f6483c20e3c482d@mail.gmail.com>
Date: Tue, 10 Oct 2006 15:31:42 +0200
From: "Nicolas FR" <nicolasfr@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: Bitbaking a recipe which refers to a missing bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2006 13:37:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I have noticed that when bitbaking a recipe which refers to a missing
.bbclass definition, there where no warning / error.

For example let's say I try to bitbake example.bb which has:
"inherits qt3x11"

if qt3x11 is missing in my /opt/OE/mybranch/classes/
then no warning / error is isued.

Should I submit a bug for this?

Regards;
Nicolas.


