Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1Pro9X-00088b-5u
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 10:03:27 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 22 Feb 2011 10:01:45 +0100
X-TM-IMSS-Message-ID: <0b437e51000035f8@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0b437e51000035f8 ;
	Tue, 22 Feb 2011 10:01:45 +0100
Message-ID: <4D637B79.4060503@nedap.com>
Date: Tue, 22 Feb 2011 10:01:45 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 22 Feb 2011 09:01:45.0648 (UTC)
	FILETIME=[21900300:01CBD26F]
Subject: findclass failure
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
X-List-Received-Date: Tue, 22 Feb 2011 09:03:27 -0000
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I'm having some trouble running sqlitejdbc.
With the zero jvm it runs ok, but with cacao it won't.

# java -zero -classpath .:/usr/share/java 
-Djava.library.path=/usr/lib/jni Test
name = Gandhi
job = politics
name = Turing
job = computers
name = Wittgenstein
job = smartypants

# java -cacao -classpath .:/usr/share/java 
-Djava.library.path=/usr/lib/jni Test
Exception in thread "main" java.sql.SQLException: no SQLite library found
         at org.sqlite.Conn.<init>(Conn.java:84)
         at org.sqlite.JDBC.connect(JDBC.java:64)
         at java.sql.DriverManager.getConnection(DriverManager.java:620)
         at java.sql.DriverManager.getConnection(DriverManager.java:222)
         at Test.main(Test.java:6)

Tracking this, I've come to this statement in NativeDB.c (jni)

     dbclass = (*env)->FindClass(env, "org/sqlite/NativeDB");

It looks like cacao uses a different way handling its classpath?

Adding code:

     dbclass = (*env)->FindClass(env, "java/lang/String");

does find the class...
So, FindClass does not always fail.

Any ideas?

Thanks!
Jaap



