Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1Hb3Ld-0002Fs-Kp
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 01:32:33 +0200
Received: by nz-out-0506.google.com with SMTP id m22so1085529nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2007 16:32:32 -0700 (PDT)
Received: by 10.114.125.2 with SMTP id x2mr2534530wac.1176161552311;
	Mon, 09 Apr 2007 16:32:32 -0700 (PDT)
Received: by 10.114.152.15 with HTTP; Mon, 9 Apr 2007 16:32:32 -0700 (PDT)
Message-ID: <bdb0025f0704091632m9aeb727m91cd10ae29197572@mail.gmail.com>
Date: Mon, 9 Apr 2007 20:32:32 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: update-alternatives-dpkg problems
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
X-List-Received-Date: Mon, 09 Apr 2007 23:32:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

/*Error 1*/

All the postinst scripts are using update-alternatives like this:

update-alternatives --install ${base_bindir}/gzip gzip gzip.${PN} 100

Then the update-alternatives-dpkg gets gzip.${PN} (actually gzip.gzip)
as it $apath
and creates the symbolic link:

/etc/alternatives/gzip -> gzip.gzip

But this symbolic link does not work... it shoud be

/etc/alternatives/gzip -> /bin/gzip.gzip

is it an error of update-alternatives script or an error of all
postinst scripts?
any idea how to fix it?

/*Error 2*/

Another error that I've found at update-alternatives-dpkg is the
$dpkglibdir variable that is hardcoded to ../utils when it should be
/usr/lib/dpkg

For a while, I've added to do_patch() function of
update-alternatives-dpkg a sed to change it in place... But I'm sure
that this is not a good fix...
any idea how to do it better?

Thanks,
vivijim at #oe


