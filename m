Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1KJYGa-0000Ht-9B
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jul 2008 20:31:48 +0200
Received: by an-out-0708.google.com with SMTP id b38so152340ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2008 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=mhP8n0QoghonIrgCttq9MgnsvWfsbTj+iL8lzGLf9vg=;
	b=GCtLQ0N0WFFegYhNbDIsFqwuqznPd9ZlByf+QTVv1Kd1kksS9OC6V8OrEAETGf82xD
	DT5pZ30AetU5LU/ediJUcNN5CCx0SOEvpDPbJ5+yArCWXYTWE1IEF5Eh0MX/k6UP/k8L
	wFR8Akd2iIJS9eKz4LKbBq60Or4OvISyYCyBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=Fdrc2G2uBFKcY/P4sZMYW77diP33D+89gVLcgOhNIJlB3Wp7DoKGN4U6P76RG9EioO
	nqrPNJqdRX/IwjFMU+0OymYhLjqPMpYsLFHf0AaHT3UNuRWawXl+6d2JBAbH+iS4dx3O
	t5s+DzP2wHKoeQF2hIeFV78hjaujfkYl4ZR20=
Received: by 10.100.110.15 with SMTP id i15mr4547854anc.130.1216319462436;
	Thu, 17 Jul 2008 11:31:02 -0700 (PDT)
Received: by 10.100.137.1 with HTTP; Thu, 17 Jul 2008 11:31:02 -0700 (PDT)
Message-ID: <3972542e0807171131t2928a73ex520179d526caccdd@mail.gmail.com>
Date: Thu, 17 Jul 2008 13:31:02 -0500
From: "E Robertson" <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: what is "No module named pstats"?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 17 Jul 2008 18:31:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I I go this error during the stage build it is always and only during
the stage. so I use this comand "bitbake -vP -b touch257 -c stage.
My stage routing in the bb file is ok just like any other.
Do I need to add this to any other file to complete the last phase?

NOTE: package touch257-2.0.8.0: started
ERROR: InvalidTask event exception, aborting
NOTE: package touch257-2.0.8.0: failed
ERROR: Build of 'touch257' failed
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 134, in <module>
    main()
  File "/usr/bin/bitbake", line 123, in main
    import pstats
ImportError: No module named pstats


Thanks.


