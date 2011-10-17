Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pandaresistor@gmail.com>) id 1RFuAW-0002cD-Er
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 22:52:20 +0200
Received: by eyd9 with SMTP id 9so3306989eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=r5hLndCgNJhFylIeFlktmCSgGqdZsW89XvCnv0z5A44=;
	b=qW1pLE7hp5o9kp0BsnyQ6SEWNZ4xUyl8UcVEdICpgu5sq6z7XQopJGL3JQgZg8kIeL
	cjRH575xbwOJlwSTkl+QyZ5b/saSpc0CC02Z3+/2sx1k4kxeeKp0JgtAgC5zpjenU/yZ
	pTGeeFigqFMGu7PZy8zhubIgGLbwSLLJ26mc4=
MIME-Version: 1.0
Received: by 10.213.13.71 with SMTP id b7mr2525236eba.85.1318884390305; Mon,
	17 Oct 2011 13:46:30 -0700 (PDT)
Received: by 10.213.14.67 with HTTP; Mon, 17 Oct 2011 13:46:30 -0700 (PDT)
Date: Mon, 17 Oct 2011 21:46:30 +0100
Message-ID: <CACphT6KqgRkRt1vtfS8ROS5P36P=yKACX0tNV6gw7NTa25U9Bg@mail.gmail.com>
From: Panda Resistor <pandaresistor@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Openssl build bug
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
X-List-Received-Date: Mon, 17 Oct 2011 20:52:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Openssl-native_1.0.0d-r14 will not build on Ubuntu 11.10, but is building on
Ubuntu 10.04. The errors are undefined reference errors, and it has been
suggested that they are linked to erroneous ordering of library dependencies
and dependency folders, however the libdepsfirst patch has been applied by
bitbake upon a compilation attempt.

Cheers

