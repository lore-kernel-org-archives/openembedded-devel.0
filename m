Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jim.rayner@gmail.com>) id 1Gl5pD-0001X0-6y
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Nov 2006 16:40:19 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1435996nfc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2006 07:37:56 -0800 (PST)
Received: by 10.82.152.16 with SMTP id z16mr242269bud.1163777876313;
	Fri, 17 Nov 2006 07:37:56 -0800 (PST)
Received: by 10.82.161.2 with HTTP; Fri, 17 Nov 2006 07:37:56 -0800 (PST)
Message-ID: <41e5b4c20611170737p4b1138c0m8798ea67e67d449@mail.gmail.com>
Date: Fri, 17 Nov 2006 15:37:56 +0000
From: "Jim Rayner" <oe@jrayner.com>
Sender: jim.rayner@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d46153c40611170647m2be6b5f6jd7cbe86ccdfc5dc@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40611170647m2be6b5f6jd7cbe86ccdfc5dc@mail.gmail.com>
X-Google-Sender-Auth: 12e5c20c4d6b24a5
Subject: Re: Problem building dbus-glib-0.72
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
X-List-Received-Date: Fri, 17 Nov 2006 15:40:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/17/06, Andrew Paulsen <andrew.paulsen@gmail.com> wrote:
> I'm getting some errors building gpe-image, specifically on the
> dbus-glib-0.72 package, that seem to be related to include path
> problems.

Maybe lacking

export DBUS_CFLAGS = " -I${STAGING_DIR}/${TARGET_SYS}/include/dbus-1.0"

or something similar from the dbus-glib-0.72.bb file

Also some similarity to http://bugs.openembedded.org/show_bug.cgi?id=1371

Jim


